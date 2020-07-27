from builtins import range, callable
from enum import IntEnum
from vsc import *


class my_e(IntEnum):
    A = auto()
    B = auto()


@covergroup
class my_covergroup(object):
    def __init__(self, a, b, c):  # Need to use lambda for non-reference values
        super().__init__()
        # self.type_options.weight = 1
        # self.options.auto_bin_max = 32

        self.cp1 = coverpoint(a,
                              options=dict(
                                  auto_bin_max=64
                              ),
                              bins=dict(
                                  a=bin_array([], [1, 15])
                              ))

        self.cp2 = coverpoint(b, bins=dict(
            b=bin_array([], [1, 15])
        ))

        self.cp3 = coverpoint(c, cp_t=enum_t(my_e))


a = 1
b = 2
c = my_e.A

cg = my_covergroup(lambda: a, lambda: b, lambda: c)

cg.sample()
a = 2
c = my_e.B
cg.sample()
a = 3
cg.sample()

cg.dump()

report_coverage(details=True)
