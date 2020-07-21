import vsc
import logging
from enum import Enum, auto

class operand_sign_e(Enum):
    POSITIVE = auto()
    NEGATIVE = auto()

class div_result_e(Enum):
    DIV_NORMAL = auto()
    DIV_BY_ZERO = auto()
    DIV_OVERFLOW = auto()

class compare_result_e(Enum):
    EQUAL = auto()
    LARGER = auto()
    SMALLER = auto()

class logical_similarity_e(Enum):
    IDENTICAL = auto()
    OPPOSITE = auto()
    SIMILAR = auto()
    DIFFERENT = auto()

class special_val_e(Enum):
    NORMAL_VAL = auto()
    MIN_VAL = auto()
    MAX_VAL = auto()
    ZERO_VAL = auto()

# dictionary to keep track of reg_name:reg_value throughout the program 
gpr_state = {}

def get_gpr(reg_name):
    reg_name = reg_name.upper()
    # logging.error...

def get_gpr_state(reg_name):
    if reg_name in ["zero", "x0"]:
        return 0
    elif reg_name in gpr_state:
        return gpr_state[reg_name]
    else:
        logging.warning("Cannot find GPR state: {}".format(reg_name))
