v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -730 -240 -650 -240 {
lab=vref_top}
N -730 -220 -650 -220 {
lab=d0}
N -750 -200 -650 -200 {
lab=d0b}
N -740 -160 -650 -160 {
lab=d1}
N -740 -140 -650 -140 {
lab=d1b}
N -730 -120 -650 -120 {
lab=gnda}
N -720 -100 -650 -100 {
lab=d2b}
N -720 -80 -650 -80 {
lab=d2}
N -730 -180 -650 -180 {
lab=vdd}
N -720 -80 -720 170 {
lab=d2}
N -710 150 -650 150 {
lab=d2b}
N -710 -100 -710 150 {
lab=d2b}
N -700 130 -650 130 {
lab=gnda}
N -700 -120 -700 130 {
lab=gnda}
N -690 110 -650 110 {
lab=d1b}
N -690 -140 -690 110 {
lab=d1b}
N -680 90 -650 90 {
lab=d1}
N -680 -160 -680 90 {
lab=d1}
N -670 70 -650 70 {
lab=vdd}
N -670 -180 -670 70 {
lab=vdd}
N -660 50 -650 50 {
lab=d0b}
N -660 -200 -660 50 {
lab=d0b}
N -810 30 -650 30 {
lab=d0}
N -810 -220 -730 -220 {
lab=d0}
N -790 -220 -790 30 {
lab=d0}
N -770 -240 -730 -240 {
lab=vref_top}
N -770 -240 -770 10 {
lab=vref_top}
N -730 -60 -650 -60 {
lab=mid_node}
N -350 -240 -250 -240 {
lab=upper_out}
N -260 -240 -260 -190 {
lab=upper_out}
N -730 -60 -730 20 {
lab=mid_node}
N -730 10 -650 10 {
lab=mid_node}
N -720 160 -650 170 {
lab=d2}
N -350 10 -270 10 {
lab=lower_out}
N -260 -190 -260 -100 {
lab=upper_out}
N -260 -110 -220 -110 {
lab=upper_out}
N -280 10 -270 -20 {
lab=lower_out}
N -270 -140 -270 -20 {
lab=lower_out}
N -270 -130 -220 -130 {
lab=lower_out}
N -240 -70 -220 -70 {
lab=d3}
N -240 -90 -220 -90 {
lab=d3b}
N 80 -110 100 -110 {
lab=v_out}
N -850 -120 -730 -120 {
lab=gnda}
N 80 -130 210 -130 {
lab=gnda}
N -820 -120 -820 250 {
lab=gnda}
N 180 -130 180 240 {
lab=gnda}
N -820 240 180 230 {
lab=gnda}
N -870 -180 -870 230 {
lab=vdd}
N -220 -50 -220 220 {
lab=vdd}
N -870 210 -220 200 {
lab=vdd}
N -870 -170 -730 -180 {
lab=vdd}
N -750 190 -650 190 {
lab=xxx}
C {xschem/TG2.sym} -70 -90 0 0 {name=x3}
C {ipin.sym} -720 -240 0 0 {name=p1 lab=vref_top}
C {ipin.sym} -720 -120 0 0 {name=p2 lab=gnda
}
C {ipin.sym} -730 -180 0 0 {name=p3 lab=vdd}
C {ipin.sym} -240 -70 0 0 {name=p4 lab=d3}
C {ipin.sym} -240 -90 0 0 {name=p5 lab=d3b}
C {ipin.sym} -720 -80 0 0 {name=p6 lab=d2}
C {ipin.sym} -710 -100 0 0 {name=p7 lab=d2b}
C {ipin.sym} -730 -160 0 0 {name=p8 lab=d1}
C {ipin.sym} -730 -140 0 0 {name=p9 lab=d1b}
C {ipin.sym} -720 -220 0 0 {name=p10 lab=d0}
C {ipin.sym} -740 -200 0 0 {name=p11 lab=d0b}
C {opin.sym} 100 -110 0 0 {name=p12 lab=v_out}
C {lab_pin.sym} -730 -60 0 0 {name=p13 sig_type=std_logic lab=mid_node}
C {lab_pin.sym} -260 -190 0 0 {name=p14 sig_type=std_logic lab=upper_out}
C {lab_pin.sym} -270 -20 0 0 {name=p15 sig_type=std_logic lab=lower_out}
C {xschem/3bitdac_v2.sym} -500 -150 0 0 {name=x1}
C {xschem/3bitdac_v2.sym} -500 100 0 0 {name=x2}
C {ipin.sym} -750 190 0 0 {name=p16 lab=vref_bottom}
