* SPICE NETLIST
***************************************

.SUBCKT L POS NEG
.ENDS
***************************************
.SUBCKT nand a gnd out b vdd
** N=6 EP=5 IP=0 FDC=4
M0 6 a gnd gnd N_18 L=1.8e-07 W=5e-07 AD=1.275e-13 AS=2.45e-13 PD=5.1e-07 PS=1.48e-06 $X=-135 $Y=-2465 $D=0
M1 out b 6 gnd N_18 L=1.8e-07 W=5e-07 AD=2.45e-13 AS=1.275e-13 PD=1.48e-06 PS=5.1e-07 $X=555 $Y=-2465 $D=0
M2 out a vdd vdd P_18 L=1.8e-07 W=1e-06 AD=2.55e-13 AS=4.9e-13 PD=5.1e-07 PS=1.98e-06 $X=-135 $Y=-355 $D=1
M3 vdd b out vdd P_18 L=1.8e-07 W=1e-06 AD=4.9e-13 AS=2.55e-13 PD=1.98e-06 PS=5.1e-07 $X=555 $Y=-355 $D=1
.ENDS
***************************************
