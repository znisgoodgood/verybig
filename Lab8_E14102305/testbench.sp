***tb***
.inc'circuit.spi'
.GLOBAL gnd
+vdd

.protect
.lib 'cic018.l' TT
.unprotect

.op
.options post
.tran 0.05n 160n
.temp 25

***test voltage***
v1 vdd gnd dc 1.8v
v2 gnd gnd dc 0v
v3 in gnd pulse(0v 1.8v 0 0.1n 0.1n 20n 40n)
v4 a gnd pulse(0v 1.8v 0 0.1n 0.1n 20n 40n)
v5 b gnd pulse(0v 1.8v 0 0.1n 0.1n 40n 80n)
v6 c gnd pulse(0v 1.8v 0 0.1n 0.1n 20n 40n)
v7 d gnd pulse(0v 1.8v 0 0.1n 0.1n 40n 80n)

xinv in vout1 vdd gnd inv
xnand a b vdd gnd vout2 nand 
xnor c d vdd gnd vout3 nor
.end
