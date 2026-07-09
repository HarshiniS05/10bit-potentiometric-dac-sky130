v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -770 -340 -600 -340 {
lab=vref_top}
N -760 -320 -600 -320 {
lab=d0}
N -760 -300 -600 -300 {
lab=d0b}
N -750 -280 -600 -280 {
lab=vdd}
N -750 -260 -600 -260 {
lab=d1}
N -760 -240 -600 -240 {
lab=d1b}
N -750 -200 -600 -200 {
lab=d2b}
N -750 -220 -600 -220 {
lab=gnda}
N -760 -180 -600 -180 {
lab=d3b}
N -760 -160 -600 -160 {
lab=d2}
N -760 -140 -600 -140 {
lab=d3}
N -750 -120 -600 -120 {
lab=mid_node}
N -610 -320 -610 -10 {
lab=d0}
N -610 -20 -590 -20 {
lab=d0}
N -620 0 -590 0 {
lab=d0b}
N -620 -300 -620 -0 {
lab=d0b}
N -630 20 -590 20 {
lab=vdd}
N -630 -280 -630 20 {
lab=vdd}
N -640 40 -590 40 {
lab=d1}
N -640 -260 -640 40 {
lab=d1}
N -650 60 -590 60 {
lab=d1b}
N -650 -240 -650 60 {
lab=d1b}
N -670 80 -590 80 {
lab=gnda}
N -660 -220 -660 80 {
lab=gnda}
N -690 100 -590 100 {
lab=d2b}
N -680 100 -670 -200 {
lab=d2b}
N -720 120 -590 120 {
lab=d3b}
N -710 -180 -710 120 {
lab=d3b}
N -730 -160 -730 140 {
lab=d2}
N -730 140 -590 140 {
lab=d2}
N -770 160 -590 160 {
lab=d3}
N -740 -140 -740 160 {
lab=d3}
N -780 -40 -590 -40 {
lab=mid_node}
N -750 -120 -750 -40 {
lab=mid_node}
N -300 -340 -240 -340 {
lab=upper_out}
N -250 -340 -250 -320 {
lab=upper_out}
N -290 -40 -210 -40 {
lab=lower_out}
N -220 -100 -220 -40 {
lab=lower_out}
N -700 180 -590 180 {
lab=vref_bottom}
N -280 -230 -190 -230 {
lab=upper_out}
N -250 -320 -250 -230 {
lab=upper_out}
N -220 -270 -220 -100 {
lab=lower_out}
N -220 -250 -190 -250 {
lab=lower_out}
N -260 -210 -190 -210 {
lab=d4b}
N -230 -190 -190 -190 {
lab=d4}
N -940 -280 -750 -280 {
lab=vdd}
N -890 -280 -890 210 {
lab=vdd}
N -890 200 -180 200 {
lab=vdd}
N 110 -250 190 -250 {
lab=gnda}
N -980 -220 -750 -220 {
lab=gnda}
N -210 -170 -190 -170 {
lab=vdd}
N -210 200 -200 -170 {
lab=vdd}
N -950 -220 -950 290 {
lab=gnda}
N 150 -250 150 290 {
lab=gnda}
N -950 270 150 260 {
lab=gnda}
N 110 -230 160 -230 {
lab=v_out}
C {xschem/TG2.sym} -40 -210 0 0 {name=x3}
C {xschem/4bitdac_v2.sym} -450 -230 0 0 {name=x1}
C {xschem/4bitdac_v2.sym} -440 70 0 0 {name=x2}
C {ipin.sym} -760 -340 0 0 {name=p1 lab=vref_top}
C {ipin.sym} -750 -320 0 0 {name=p2 lab=d0}
C {ipin.sym} -750 -280 0 0 {name=p3 lab=vdd}
C {ipin.sym} -750 -240 0 0 {name=p4 lab=d1b}
C {ipin.sym} -750 -300 0 0 {name=p5 lab=d0b}
C {ipin.sym} -740 -260 0 0 {name=p6 lab=d1}
C {ipin.sym} -740 -220 0 0 {name=p7 lab=gnda}
C {ipin.sym} -740 -200 0 0 {name=p8 lab=d2b}
C {ipin.sym} -750 -180 0 0 {name=p9 lab=d3b}
C {ipin.sym} -750 -160 0 0 {name=p10 lab=d2}
C {ipin.sym} -750 -140 0 0 {name=p12 lab=d3}
C {lab_pin.sym} -750 -120 0 0 {name=p13 sig_type=std_logic lab=mid_node}
C {lab_pin.sym} -220 -100 0 0 {name=p14 sig_type=std_logic lab=lower_out}
C {lab_pin.sym} -250 -320 0 0 {name=p15 sig_type=std_logic lab=upper_out}
C {ipin.sym} -240 -210 0 0 {name=p16 lab=d4b}
C {ipin.sym} -230 -190 0 0 {name=p17 lab=d4}
C {opin.sym} 160 -230 0 0 {name=p11 lab=v_out}
C {ipin.sym} -690 180 0 0 {name=p18 lab=vref_bottom}
