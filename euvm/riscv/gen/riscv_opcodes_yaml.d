import dyaml;

import std.algorithm: canFind;
import std.format: format;
import std.stdio: write, writeln, writef, writefln, stderr;

string[] riscv_dv_handled_extentions = ["rv_s",
					"rv_system",
					"rv_sdext",
					"rv_i",
					"rv32_i",
					"rv64_i",
					"rv_c",
					"rv32_c",
					"rv_c_d",
					"rv64_c",
					"rv128_c",
					"rv_zba",
					"rv64_zba",
					"rv_zbb",
					"rv64_zbb",
					"rv_zbc",
					"rv_zbe",
					"rv64_zbe",
					"rv_zbf",
					"rv64_zbf",
					"rv64_zbm",
					"rv_zbp",
					"rv64_zbp",
					"rv_zbr",
					"rv64_zbr",
					"rv_zbs",
					"rv64_zbs",
					"rv_zbt",
					"rv64_zbt",
					"rv64_zks",
					"rv_b",
					"rv64_b",
					"rv_m",
					"rv64_m",
					"rv_f",
					"rv32_c_f",
					"rv64_f",
					"rv_d",
					"rv32_c_d",
					"rv64_d",
					"rv_a",
					"rv64_a",
					"rv_v",
					"rv_v_aliases",
					"rv_zicsr",
					"rv_zifencei",
					"rv_zvknha",
					"rv_zvknhb",
					"rv_zpn",
					"rv32_zpn",
					"rv64_zpn",
					"rv_zvkg",
					"rv_zvkn",
					"rv_zvks"
					];

string[] riscv_dv_handled_instrs;

struct riscv_opcodes_args_params_s {
  string               _arg;
  ubyte                _msb;
  ubyte                _lsb;
}

riscv_opcodes_args_params_s[] riscv_opcodes_args_params =
  [
   riscv_opcodes_args_params_s("rd", 11, 7),
   riscv_opcodes_args_params_s("rt", 19, 15),
   riscv_opcodes_args_params_s("rs1", 19, 15),
   riscv_opcodes_args_params_s("rs2", 24, 20),
   riscv_opcodes_args_params_s("rs3", 31, 27),
   riscv_opcodes_args_params_s("aqrl", 26, 25),
   riscv_opcodes_args_params_s("aq", 26, 26),
   riscv_opcodes_args_params_s("rl", 25, 25),
   riscv_opcodes_args_params_s("fm", 31, 28),
   riscv_opcodes_args_params_s("pred", 27, 24),
   riscv_opcodes_args_params_s("succ", 23, 20),
   riscv_opcodes_args_params_s("rm", 14, 12),
   riscv_opcodes_args_params_s("funct3", 14, 12),
   riscv_opcodes_args_params_s("funct2", 26, 25),
   riscv_opcodes_args_params_s("imm20", 31, 12),
   riscv_opcodes_args_params_s("jimm20", 31, 12),
   riscv_opcodes_args_params_s("imm12", 31, 20),
   riscv_opcodes_args_params_s("csr", 31, 20),
   riscv_opcodes_args_params_s("imm12hi", 31, 25),
   riscv_opcodes_args_params_s("bimm12hi", 31, 25),
   riscv_opcodes_args_params_s("imm12lo", 11, 7),
   riscv_opcodes_args_params_s("bimm12lo", 11, 7),
   riscv_opcodes_args_params_s("zimm", 19, 15),
   riscv_opcodes_args_params_s("shamtq", 26, 20),
   riscv_opcodes_args_params_s("shamtw", 24, 20),
   riscv_opcodes_args_params_s("shamtw4", 23, 20),
   riscv_opcodes_args_params_s("shamtd", 25, 20),
   riscv_opcodes_args_params_s("bs", 31, 30),
   riscv_opcodes_args_params_s("rnum", 23, 20),
   riscv_opcodes_args_params_s("rc", 29, 25),
   riscv_opcodes_args_params_s("imm2", 21, 20),
   riscv_opcodes_args_params_s("imm3", 22, 20),
   riscv_opcodes_args_params_s("imm4", 23, 20),
   riscv_opcodes_args_params_s("imm5", 24, 20),
   riscv_opcodes_args_params_s("imm6", 25, 20),
   riscv_opcodes_args_params_s("opcode", 6,0),
   riscv_opcodes_args_params_s("funct7", 31,25),

   //  for vectors
   riscv_opcodes_args_params_s("vd", 11, 7),
   riscv_opcodes_args_params_s("vs3", 11, 7),
   riscv_opcodes_args_params_s("vs1", 19, 15),
   riscv_opcodes_args_params_s("vs2", 24, 20),
   riscv_opcodes_args_params_s("vm", 25, 25),
   riscv_opcodes_args_params_s("wd", 26, 26),
   riscv_opcodes_args_params_s("amoop", 31, 27),
   riscv_opcodes_args_params_s("nf", 31, 29),
   riscv_opcodes_args_params_s("simm5", 19, 15),
   riscv_opcodes_args_params_s("zimm5", 19, 15),
   riscv_opcodes_args_params_s("zimm10", 29, 20),
   riscv_opcodes_args_params_s("zimm11", 30, 20),
   riscv_opcodes_args_params_s("zimm6hi", 26, 26),
   riscv_opcodes_args_params_s("zimm6lo", 19, 15),


   // compressed immediates and fields
   riscv_opcodes_args_params_s("c_nzuimm10", 12, 5),
   riscv_opcodes_args_params_s("c_uimm7lo", 6, 5),
   riscv_opcodes_args_params_s("c_uimm7hi", 12, 10),
   riscv_opcodes_args_params_s("c_uimm8lo", 6, 5),
   riscv_opcodes_args_params_s("c_uimm8hi", 12, 10),
   riscv_opcodes_args_params_s("c_uimm9lo", 6, 5),
   riscv_opcodes_args_params_s("c_uimm9hi", 12, 10),
   riscv_opcodes_args_params_s("c_nzimm6lo", 6, 2),
   riscv_opcodes_args_params_s("c_nzimm6hi", 12, 12),
   riscv_opcodes_args_params_s("c_imm6lo", 6, 2),
   riscv_opcodes_args_params_s("c_imm6hi", 12, 12),
   riscv_opcodes_args_params_s("c_nzimm10hi", 12, 12),
   riscv_opcodes_args_params_s("c_nzimm10lo", 6, 2),
   riscv_opcodes_args_params_s("c_nzimm18hi", 12, 12),
   riscv_opcodes_args_params_s("c_nzimm18lo", 6, 2),
   riscv_opcodes_args_params_s("c_imm12", 12, 2),
   riscv_opcodes_args_params_s("c_bimm9lo", 6, 2),
   riscv_opcodes_args_params_s("c_bimm9hi", 12, 10),
   riscv_opcodes_args_params_s("c_nzuimm5", 6, 2),
   riscv_opcodes_args_params_s("c_nzuimm6lo", 6, 2),
   riscv_opcodes_args_params_s("c_nzuimm6hi", 12, 12),
   riscv_opcodes_args_params_s("c_uimm8splo", 6, 2),
   riscv_opcodes_args_params_s("c_uimm8sphi", 12, 12),
   riscv_opcodes_args_params_s("c_uimm8sp_s", 12, 7),
   riscv_opcodes_args_params_s("c_uimm10splo", 6, 2),
   riscv_opcodes_args_params_s("c_uimm10sphi", 12, 12),
   riscv_opcodes_args_params_s("c_uimm9splo", 6, 2),
   riscv_opcodes_args_params_s("c_uimm9sphi", 12, 12),
   riscv_opcodes_args_params_s("c_uimm10sp_s", 12, 7),
   riscv_opcodes_args_params_s("c_uimm9sp_s", 12, 7),
   riscv_opcodes_args_params_s("c_uimm2", 6, 5),
   riscv_opcodes_args_params_s("c_uimm1", 5, 5),
   riscv_opcodes_args_params_s("c_rlist", 7, 4),
   riscv_opcodes_args_params_s("c_spimm", 3, 2),
   riscv_opcodes_args_params_s("c_index", 9, 2),

   riscv_opcodes_args_params_s("rs1_p", 9, 7),
   riscv_opcodes_args_params_s("rs2_p", 4, 2),
   riscv_opcodes_args_params_s("rd_p", 4, 2),
   riscv_opcodes_args_params_s("rd_rs1_n0", 11, 7),
   riscv_opcodes_args_params_s("rd_rs1_p", 9, 7),
   riscv_opcodes_args_params_s("rd_rs1", 11, 7),
   riscv_opcodes_args_params_s("rd_n2", 11, 7),
   riscv_opcodes_args_params_s("rd_n0", 11, 7),
   riscv_opcodes_args_params_s("rs1_n0", 11, 7),
   riscv_opcodes_args_params_s("c_rs2_n0", 6, 2),
   riscv_opcodes_args_params_s("c_rs1_n0", 11, 7),
   riscv_opcodes_args_params_s("c_rs2", 6, 2),
   riscv_opcodes_args_params_s("c_sreg1", 9, 7),
   riscv_opcodes_args_params_s("c_sreg2", 4, 2),
   ];
	
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

  // string instr_variables;
  // string instr_extentions;
  string instr_params;

  this(string yaml) {
    import std.traits: EnumMembers;
    yaml_root = Loader.fromFile(yaml).load();

  }

  string[] var_arg_list;

  // check if all instructions in given extentions are present in the enum riscv_instr_name_t
  bool check_ext(string[] extns) {
    import std.string: toLower, toUpper;
    foreach (op_instr; yaml_root.mapping()) {
      auto iextns = op_instr.value["extension"];
      for (int i=0; i!=iextns.length;i+=1) {
	auto iext = iextns[i].get!string();
	if (extns.canFind(iext)) {
	  string instrN = op_instr.key.get!string().toUpper;
	  if (instrN.length > 5 && instrN[$-5..$] == "_RV32" ||
	      instrN.length > 5 && instrN[$-5..$] == "_RV64") {
	    stderr.writefln("Checking on instruction: %s, %s",
			    instrN, iextns.length);
	  }
	}
      }
    }
    return true;
  }
  
  void parse_opcode_yaml() {
    import std.stdio;
    import std.traits: EnumMembers;

    string instrName;
    
    instr_params = "\n  [";

    foreach (instr; yaml_root.mapping()) {
      import std.string: toLower, toUpper;

      bool isListedExtn = false;

      foreach (Node extn; instr.value["extension"]) {
	auto extnStr = extn.get!string();
	if (riscv_dv_handled_extentions.canFind(extnStr)) {
	  isListedExtn = true;
	  continue;
	}
      }

      if (! isListedExtn) continue;

      instrName = instr.key.get!string().toUpper();

      if ((instrName.length > 5 &&
	   (instrName[$-5..$] == "_RV32" || instrName[$-5..$] == "_RV64")) ||
	  (instrName.length > 6 && instrName[$-6..$] == "_RV128")) {
	stderr.writeln("Ignoring Istruction: ", instrName);
	continue;
      }
      
      riscv_dv_handled_instrs ~= instrName;
      // writeln("Parsing instruction: ", instr.key.get!string());

      // if (j != 0) instr_params ~= "   ";

      string dv_instr = instr.key.get!string().toUpper();

      instr_params ~= "  riscv_instr_param_s(\n     riscv_instr_name_t." ~ dv_instr ~ ", // instr_name\n     ";

      if (dv_instr == "invalid_instr") {
	instr_params ~= "riscv_instr_name_t." ~ dv_instr ~ ", // orig_name\n     ";
	instr_params ~= "0xFFFFFFFF, // mask\n     ";
	instr_params ~= "0x00000000, // match\n     ";
	instr_params ~= "[], // _var_list\n     ";
	instr_params ~= "[], // _ext_list\n     ";
	instr_params ~= "0x0, // _imms\n     ";
	instr_params ~= "0x0, // _c_imms\n     ";
	instr_params ~= "0x0, // _v_imms\n     ";
	instr_params ~= "0x0, // _vars\n     ";
	instr_params ~= "0x0, // _c_vars\n     ";
	instr_params ~= "0x0, // _v_vars\n   ";
      }
      else {
	auto instrData = instr.value;
	auto mask = instrData["mask"];

	if ("orig_inst" in instrData) {
	  import std.string: toUpper;
	  auto orig_inst = instrData["orig_inst"];
	  instr_params ~= "riscv_instr_name_t." ~
	    orig_inst.get!string().toUpper() ~ ", // orig_name\n     ";
	}
	else {
	  instr_params ~= "riscv_instr_name_t." ~ dv_instr ~ ", // orig_name\n     ";
	}

	  
	// pragma(msg, typeof(mask));
	instr_params ~= mask.get!string() ~ ", // mask\n     ";

	auto match = instrData["match"];
	// pragma(msg, typeof(match));
	instr_params ~= match.get!string() ~ ", // match\n     ";

	auto variable_fields = instrData["variable_fields"];

	instr_params ~= ("[");
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  if (! var_arg_list.canFind(vf)) var_arg_list ~= vf;
	  instr_params ~= "riscv_instr_var_t." ~ vf;
	  if (i != variable_fields.length - 1) instr_params ~= ", ";
	}
	instr_params ~= ("], // variables\n     ");      

	auto extension = instrData["extension"];
	// pragma(msg, typeof(extension));

	instr_params ~= ("[");
	for (int i=0; i != extension.length; i += 1) {
	  auto field = extension[i];
	  string ext = field.get!string();
	  if (riscv_dv_handled_extentions.canFind(ext)) {
	    instr_params ~= "riscv_extention_t." ~ ext;
	    if (i != extension.length - 1) instr_params ~= ", ";
	  }
	}
	instr_params ~= ("], // extentions\n     ");      

	ulong imm_bits;
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (imm; EnumMembers!riscv_opcodes_imm_t) {
	    if (vf == imm.stringof["riscv_opcodes_imm_t".length+1..$])
	      imm_bits |= 0x1UL << imm;
	  }
	}
	instr_params ~= format("0b%0b, // _imms\n     ", imm_bits);

	ulong c_imm_bits;
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (c_imm; EnumMembers!riscv_opcodes_c_imm_t) {
	    if (vf == c_imm.stringof["riscv_opcodes_c_imm_t".length+1..$])
	      c_imm_bits |= 0x1UL << c_imm;
	  }
	}
	instr_params ~= format("0b%0b, // _c_imms\n     ", c_imm_bits);
      
	ulong v_imm_bits;
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (v_imm; EnumMembers!riscv_opcodes_v_imm_t) {
	    if (vf == v_imm.stringof["riscv_opcodes_v_imm_t".length+1..$])
	      v_imm_bits |= 0x1UL << v_imm;
	  }
	}
	instr_params ~= format("0b%0b, // _v_imms\n     ", v_imm_bits);
      
	ulong var_bits;
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (var; EnumMembers!riscv_opcodes_var_t) {
	    if (vf == var.stringof["riscv_opcodes_var_t".length+1..$])
	      var_bits |= 0x1UL << var;
	  }
	}
	instr_params ~= format("0b%0b, // _vars\n     ", var_bits);
      
	ulong c_var_bits;
	for (int i=0; i != variable_fields.length; i += 1) {
	  auto field = variable_fields[i];
	  string vf = field.get!string();
	  foreach (c_var; EnumMembers!riscv_opcodes_c_var_t) {
	    if (vf == c_var.stringof["riscv_opcodes_c_var_t".length+1..$])
	      c_var_bits |= 0x1UL << c_var;
	  }
	}
	instr_params ~= format("0b%0b, // _c_vars\n     ", c_var_bits);

	ulong v_var_bits;
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
      
      // if (j == EnumMembers!riscv_instr_name_t.length - 1) {
      // 	instr_params ~= ") // " ~ dv_instr;
      // 	instr_params ~= "\n];\n";
      // }
      // else {
      instr_params ~= "), // " ~ dv_instr;
      instr_params ~= "\n";
      // }
    }
    instr_params ~= "];";
  }


  void print() {
    import std.traits: EnumMembers;
  
    writeln("module riscv.gen.riscv_opcodes_pkg;\n");
    // writeln("import riscv.gen.riscv_instr_pkg;");

    parse_opcode_yaml();

    writeln("enum riscv_instr_name_t: short {");
    foreach (instr; riscv_dv_handled_instrs) {
      writeln("    ", instr, ",");
    }
    writeln("    INVALID_INSTR\n}");

    
    writeln(riscv_opcodes_types);
    
    writeln("enum riscv_extention_t: short {");
    foreach (i, ext; riscv_dv_handled_extentions) {
      write("  " ~ ext);
      if (i != riscv_dv_handled_extentions.length - 1) writeln(",");
    }

    write("\n};");

    writeln(q{
	struct riscv_instr_var_params_s {
	  riscv_instr_var_t _arg;
	  ubyte             _lsb;
	  ubyte             _msb;
	}
	
	struct riscv_instr_param_s {
	  riscv_instr_name_t _name;
	  riscv_instr_name_t _orig_name;
	  uint _mask;
	  uint _match;
	  riscv_instr_var_t[] _var_list;
	  riscv_extention_t[] _ext_list;
	  ulong _imms;
	  ulong _c_imms;
	  ulong _v_imms;
	  ulong _vars;
	  ulong _c_vars;
	  ulong _v_vars;
	}

      });

    
    writeln("enum riscv_instr_var_t: short {");
    foreach (arg; riscv_opcodes_args_params) {
      // if (var_arg_list.canFind(arg._arg)) {
      writefln("  %s,", arg._arg);
      // }
    }
    writeln("}\n");
    
    writeln("enum riscv_instr_var_params_s[] riscv_instr_var_params = [");
    foreach (arg; riscv_opcodes_args_params) {
      // if (var_arg_list.canFind(arg._arg)) {
      writefln("  riscv_instr_var_params_s(riscv_instr_var_t.%s, %s, %s),",
	       arg._arg, arg._lsb, arg._msb + 1);
      // }
    }
    writeln("];\n");
    

    // writeln("enum riscv_opcodes_args_list = create_args_table();");
    // writefln("enum riscv_instr_opcodes = %s", instr_opcodes);
    // writefln("enum riscv_instr_variables = %s", instr_variables);
    // writefln("enum riscv_instr_extentions = %s", instr_extentions);
    writefln("enum riscv_instr_params = %s", instr_params);
  }
}


void main() {
  auto opcodeData = new Opcodes("riscv-opcodes.yaml");
  opcodeData.check_ext(riscv_dv_handled_extentions);
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
// 	str ~= "riscv_instr_var_t." ~ vf;
// 	if (i != variable_fields.length - 1) str ~= ", ";
//       }
//       str ~= ("];\n");      
//     }
//   }
//   return str;
// }
