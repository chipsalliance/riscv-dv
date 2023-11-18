import dyaml;
import riscv.gen.riscv_instr_pkg;

import std.algorithm: canFind;
import std.format: format;

enum string riscv_opcodes_types = q{

  enum riscv_opcodes_imm_t: byte {
    imm20,
    jimm20,
    imm12,
    imm12hi,
    bimm12hi,
    imm12lo,
    bimm12lo,
    imm2,
    imm3,
    imm4,
    imm5,
    imm6,
    zimm
  }

  enum riscv_opcodes_v_imm_t: byte {
    simm5,
    zimm5,
    zimm10,
    zimm11,
    zimm6hi,
    zimm6lo
  }

  enum riscv_opcodes_c_imm_t: byte {
    c_nzuimm10,
    c_uimm7lo,
    c_uimm7hi,
    c_uimm8lo,
    c_uimm8hi,
    c_uimm9lo,
    c_uimm9hi,
    c_nzimm6lo,
    c_nzimm6hi,
    c_imm6lo,
    c_imm6hi,
    c_nzimm10hi,
    c_nzimm10lo,
    c_nzimm18hi,
    c_nzimm18lo,
    c_imm12,
    c_bimm9lo,
    c_bimm9hi,
    c_nzuimm5,
    c_nzuimm6lo,
    c_nzuimm6hi,
    c_uimm8splo,
    c_uimm8sphi,
    c_uimm8sp_s,
    c_uimm10splo,
    c_uimm10sphi,
    c_uimm9splo,
    c_uimm9sphi,
    c_uimm10sp_s,
    c_uimm9sp_s,
    c_uimm2,
    c_uimm1,
    c_spimm
  }

  enum riscv_opcodes_var_t: byte {
    rd,
    rt,
    rs1,
    rs2,
    rs3,
    aqrl,
    aq,
    rl,
    fm,
    pred,
    succ,
    rm,
    funct3,
    funct2,
    csr,
    shamtq,
    shamtw,
    shamtw4,
    shamtd,
    bs,
    rnum,
    rc,
    opcode,
    funct7
  }

  enum riscv_opcodes_v_var_t: byte {
    vd,
    vs3,
    vs1,
    vs2,
    vm,
    wd,
    amoop,
    nf
  }
 
  enum riscv_opcodes_c_var_t: byte {
    c_rlist,
    c_index,
    rs1_p,
    rs2_p,
    rd_p,
    rd_rs1_n0,
    rd_rs1_p,
    rd_rs1,
    rd_n2,
    rd_n0,
    rs1_n0,
    c_rs2_n0,
    c_rs1_n0,
    c_rs2,
    c_sreg1,
    c_sreg2
  }

};

mixin(riscv_opcodes_types);
  
class Opcodes
{
  Node yaml_root;

  string instr_variables;
  string instr_extensions;
  string instr_opcodes;
  string instr_params;

  string[] ext_list;

  this(string yaml) {
    yaml_root = Loader.fromFile(yaml).load();
  }

  void tabulate_instr_parameters() {
    import std.stdio;
    import std.traits: EnumMembers;
    instr_params = "\n  [";

    foreach (j, instr_name; EnumMembers!riscv_instr_name_t) {
      import std.string: toLower;
      if (j != 0) instr_params ~= "   ";
      string dv_instr = instr_name.stringof[19..$].toLower();

      instr_params ~= "riscv_instr_param_s(\n     " ~ instr_name.stringof ~ ", // instr_name\n     ";

      // instr mask
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "0xFFFFFFFF, // mask\n     ";
      }
      else {
	auto instr = yaml_root[dv_instr];
	auto mask = instr["mask"];
	// pragma(msg, typeof(mask));
	instr_params ~= mask.get!string() ~ ", // mask\n     ";
      }

      // instr match
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "0x00000013, // match\n     ";
      }
      else {
	auto instr = yaml_root[dv_instr];
	auto match = instr["match"];
	// pragma(msg, typeof(match));
	instr_params ~= match.get!string() ~ ", // match\n     ";
      }

      // instr variables
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "[], // variables\n     ";
      }
      else {
	auto instr = yaml_root[dv_instr];
	auto variable_fields = instr["variable_fields"];
	// pragma(msg, typeof(variable_fields));

	instr_params ~= ("[");
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  instr_params ~= "riscv_opcodes_args_t." ~ vf;
	  if (i != variable_fields.length - 1) instr_params ~= ", ";
	}
	instr_params ~= ("], // variables\n     ");      
      }

      // instr extension
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "[], // extensions\n     ";
      }
      else {
	auto instr = yaml_root[dv_instr];
	auto extension = instr["extension"];
	// pragma(msg, typeof(extension));

	instr_params ~= ("[");
	for (int i=0; i != extension.length; i += 1) {
	  auto field = extension[i];
	  string ext = field.get!string();
	  if (! canFind(ext_list, ext)) ext_list ~= ext;
	  instr_params ~= "riscv_extention_t." ~ ext;
	  if (i != extension.length - 1) instr_params ~= ", ";
	}
	instr_params ~= ("], // extensions\n     ");      
      }

      // ulong _imms;
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "0x0, // _imms\n     ";
      }
      else {
	ulong imm_bits;
	auto instr = yaml_root[dv_instr];
	auto variable_fields = instr["variable_fields"];
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (imm; EnumMembers!riscv_opcodes_imm_t) {
	    if (vf == imm.stringof["riscv_opcodes_imm_t".length+1..$])
	      imm_bits |= 0x1UL << imm;
	  }
	}
	instr_params ~= format("0b%0b, // _imms\n     ", imm_bits);
      }
      
      // ulong _c_imms;
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "0x0, // _c_imms\n     ";
      }
      else {
	ulong c_imm_bits;
	auto instr = yaml_root[dv_instr];
	auto variable_fields = instr["variable_fields"];
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (c_imm; EnumMembers!riscv_opcodes_c_imm_t) {
	    if (vf == c_imm.stringof["riscv_opcodes_c_imm_t".length+1..$])
	      c_imm_bits |= 0x1UL << c_imm;
	  }
	}
	instr_params ~= format("0b%0b, // _c_imms\n     ", c_imm_bits);
      }
      
      
      // ulong _v_imms;
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "0x0, // _v_imms\n     ";
      }
      else {
	ulong v_imm_bits;
	auto instr = yaml_root[dv_instr];
	auto variable_fields = instr["variable_fields"];
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (v_imm; EnumMembers!riscv_opcodes_v_imm_t) {
	    if (vf == v_imm.stringof["riscv_opcodes_v_imm_t".length+1..$])
	      v_imm_bits |= 0x1UL << v_imm;
	  }
	}
	instr_params ~= format("0b%0b, // _v_imms\n     ", v_imm_bits);
      }
      
      // ulong _vars;
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "0x0, // _vars\n     ";
      }
      else {
	ulong var_bits;
	auto instr = yaml_root[dv_instr];
	auto variable_fields = instr["variable_fields"];
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (var; EnumMembers!riscv_opcodes_var_t) {
	    if (vf == var.stringof["riscv_opcodes_var_t".length+1..$])
	      var_bits |= 0x1UL << var;
	  }
	}
	instr_params ~= format("0b%0b, // _vars\n     ", var_bits);
      }
      
      // ulong _c_vars;
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "0x0, // _c_vars\n     ";
      }
      else {
	ulong c_var_bits;
	auto instr = yaml_root[dv_instr];
	auto variable_fields = instr["variable_fields"];
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (c_var; EnumMembers!riscv_opcodes_c_var_t) {
	    if (vf == c_var.stringof["riscv_opcodes_c_var_t".length+1..$])
	      c_var_bits |= 0x1UL << c_var;
	  }
	}
	instr_params ~= format("0b%0b, // _c_vars\n     ", c_var_bits);
      }
      
      
      // ulong _v_vars;
      if (dv_instr == "nop" || dv_instr == "invalid_instr") {
	instr_params ~= "0x0, // _v_vars\n   ";
      }
      else {
	ulong v_var_bits;
	auto instr = yaml_root[dv_instr];
	auto variable_fields = instr["variable_fields"];
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (v_var; EnumMembers!riscv_opcodes_v_var_t) {
	    if (vf == v_var.stringof["riscv_opcodes_v_var_t".length+1..$])
	      v_var_bits |= 0x1UL << v_var;
	  }
	}
	instr_params ~= format("0b%0b, // _v_vars\n   ", v_var_bits);
      }
      
      

      if (j == EnumMembers!riscv_instr_name_t.length - 1) {
	instr_params ~= ") // " ~ dv_instr;
	instr_params ~= "\n];\n";
      }
      else {
	instr_params ~= "), // " ~ dv_instr;
	instr_params ~= "\n";
      }
    }
  }


  void tabulate_opcodes() {
    import std.stdio;
    import std.traits: EnumMembers;
    instr_opcodes = "\n  [";

    foreach (j, instr_name; EnumMembers!riscv_instr_name_t) {
      import std.string: toLower;
      if (j != 0) instr_opcodes ~= "   ";
      string dv_instr = instr_name.stringof[19..$].toLower();
      instr_opcodes ~= instr_name.stringof;
      if (j == EnumMembers!riscv_instr_name_t.length - 1) {
	instr_opcodes ~= "\n];\n";
      }
      else {
	instr_opcodes ~= ", \n";
      }
    }
  }

  void print() {
    import std.stdio: writeln, write, writef, writefln;
    import std.traits: EnumMembers;
  
    writeln("module riscv.gen.riscv_opcodes_pkg;");
    writeln("import riscv.gen.riscv_instr_pkg;");
  
    tabulate_opcodes();
    tabulate_instr_parameters();

    writeln(riscv_opcodes_types);
    
    writeln("enum riscv_extention_t: short {");
    foreach (i, ext; ext_list) {
      write("  " ~ ext);
      if (i != ext_list.length - 1) writeln(",");
    }

    write("\n};");

    writeln(q{

	struct riscv_instr_param_s {
	  riscv_instr_name_t _name;
	  uint _mask;
	  uint _match;
	  riscv_opcodes_args_t[] _vars;
	  riscv_extention_t[] _exts;
	  ulong _imms;
	  ulong _c_imms;
	  ulong _v_imms;
	  ulong _vars;
	  ulong _c_vars;
	  ulong _v_vars;
	}

	// look up table of position of various arguments that are used by the
	// instructions in the encoding files.
	enum riscv_opcodes_args_t: short {
	  rd,
	  rt,
	  rs1,
	  rs2,
	  rs3,
	  aqrl,
	  aq,
	  rl,
	  fm,
	  pred,
	  succ,
	  rm,
	  funct3,
	  funct2,
	  imm20,
	  jimm20,
	  imm12,
	  csr,
	  imm12hi,
	  bimm12hi,
	  imm12lo,
	  bimm12lo,
	  zimm,
	  shamtq,
	  shamtw,
	  shamtw4,
	  shamtd,
	  bs,
	  rnum,
	  rc,
	  imm2,
	  imm3,
	  imm4,
	  imm5,
	  imm6,
	  opcode,
	  funct7,

	  //  for vectors
	  vd,
	  vs3,
	  vs1,
	  vs2,
	  vm,
	  wd,
	  amoop,
	  nf,
	  simm5,
	  zimm5,
	  zimm10,
	  zimm11,
	  zimm6hi,
	  zimm6lo,


	  // compressed immediates and fields
	  c_nzuimm10,
	  c_uimm7lo,
	  c_uimm7hi,
	  c_uimm8lo,
	  c_uimm8hi,
	  c_uimm9lo,
	  c_uimm9hi,
	  c_nzimm6lo,
	  c_nzimm6hi,
	  c_imm6lo,
	  c_imm6hi,
	  c_nzimm10hi,
	  c_nzimm10lo,
	  c_nzimm18hi,
	  c_nzimm18lo,
	  c_imm12,
	  c_bimm9lo,
	  c_bimm9hi,
	  c_nzuimm5,
	  c_nzuimm6lo,
	  c_nzuimm6hi,
	  c_uimm8splo,
	  c_uimm8sphi,
	  c_uimm8sp_s,
	  c_uimm10splo,
	  c_uimm10sphi,
	  c_uimm9splo,
	  c_uimm9sphi,
	  c_uimm10sp_s,
	  c_uimm9sp_s,
	  c_uimm2,
	  c_uimm1,
	  c_rlist,
	  c_spimm,
	  c_index,

	  rs1_p,
	  rs2_p,
	  rd_p,
	  rd_rs1_n0,
	  rd_rs1_p,
	  rd_rs1,
	  rd_n2,
	  rd_n0,
	  rs1_n0,
	  c_rs2_n0,
	  c_rs1_n0,
	  c_rs2,
	  c_sreg1,
	  c_sreg2
	}
      });

    

    // writeln("enum riscv_opcodes_args_list = create_args_table();");
    writefln("enum riscv_instr_opcodes = %s", instr_opcodes);
    // writefln("enum riscv_instr_variables = %s", instr_variables);
    // writefln("enum riscv_instr_extentions = %s", instr_extensions);
    writefln("enum riscv_instr_params = %s", instr_params);
  }
}


void main() {
  auto opcodeData = new Opcodes("riscv-opcodes.yaml");
  opcodeData.print();
}

// string instr_assign(Node yaml_root) {
//   import std.stdio;
//   import std.traits: EnumMembers;
//   string str;

//   foreach (instr_name; EnumMembers!riscv_instr_name_t) {
//     import std.string: toLower;
//     string dv_instr = instr_name.stringof[19..$].toLower();
//     if (dv_instr != "nop" && dv_instr != "invalid_instr") {
//       auto instr = yaml_root[dv_instr];
//       str ~= "table[" ~ instr_name.stringof ~ "] = ";
//       // write(dv_instr, " ");
//       auto variable_fields = instr["variable_fields"];
//       // pragma(msg, typeof(variable_fields));

//       str ~= ("[");
//       for (int i=0; i != variable_fields.length; i += 1) {
// 	auto field = variable_fields[i];
// 	string vf = field.get!string();
// 	str ~= "riscv_opcodes_args_t." ~ vf;
// 	if (i != variable_fields.length - 1) str ~= ", ";
//       }
//       str ~= ("];\n");      
//     }
//   }
//   return str;
// }
