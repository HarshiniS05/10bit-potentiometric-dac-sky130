v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -740 -250 -380 -250 {
lab=vref_top}
N -730 -230 -380 -230 {
lab=d0}
N -730 -210 -380 -210 {
lab=d0b}
N -730 -190 -380 -190 {
lab=vdd}
N -730 -170 -380 -170 {
lab=d1}
N -740 -110 -380 -110 {
lab=d4b}
N -740 -90 -380 -90 {
lab=d2b}
N -750 -70 -380 -70 {
lab=d5b}
N -750 -50 -380 -50 {
lab=d4}
N -760 -30 -380 -30 {
lab=d5}
N -750 -10 -380 -10 {
lab=d3b}
N -750 10 -380 10 {
lab=d2}
N -740 30 -380 30 {
lab=d3}
N -400 -230 -400 170 {
lab=d0}
N -400 160 -380 170 {
lab=d0}
N -410 190 -380 190 {
lab=d0b}
N -410 -210 -410 200 {
lab=d0b}
N -430 -190 -430 220 {
lab=vdd}
N -430 210 -380 210 {
lab=vdd}
N -450 230 -380 230 {
lab=d1}
N -440 -170 -440 230 {
lab=d1}
N -500 270 -380 270 {
lab=gnda}
N -480 -130 -480 270 {
lab=gnda}
N -520 290 -380 290 {
lab=d4b}
N -510 -110 -510 290 {
lab=d4b}
N -560 310 -380 310 {
lab=d2b}
N -540 -90 -540 310 {
lab=d2b}
N -590 330 -380 330 {
lab=d5b}
N -570 -70 -570 330 {
lab=d5b}
N -640 350 -380 350 {
lab=d4}
N -610 -50 -610 350 {
lab=d4}
N -680 370 -380 370 {
lab=d5}
N -670 -30 -670 370 {
lab=d5}
N -700 -10 -700 390 {
lab=d3b}
N -780 410 -370 410 {
lab=d2}
N -740 410 -730 10 {
lab=d2}
N -830 430 -380 430 {
lab=d3}
N -680 450 -380 450 {
lab=vref_bottom}
N -80 -250 -80 -220 {
lab=upper_out}
N -80 150 -70 70 {
lab=lower_out}
N -70 -110 -20 -110 {
lab=upper_out}
N -80 -220 -60 -110 {
lab=upper_out}
N -40 -130 -20 -130 {
lab=lower_out}
N -30 -130 -30 70 {
lab=lower_out}
N -60 -90 -20 -90 {
lab=d6b}
N -50 -70 -20 -70 {
lab=d6}
N -70 70 -30 10 {
lab=lower_out}
N -20 -50 -20 620 {
lab=vdd}
N -1030 -190 -730 -190 {
lab=vdd}
N -1000 -190 -1000 620 {
lab=vdd}
N -1000 600 -20 600 {
lab=vdd}
N 270 -130 500 -130 {
lab=gnda}
N 470 -130 470 590 {
lab=gnda}
N 280 -110 330 -110 {
lab=v_out}
N -380 50 -380 70 {
lab=mid_node}
N -380 70 -380 150 {
lab=mid_node}
N -700 380 -380 390 {
lab=d3b}
N -720 30 -720 430 {
lab=d3}
N -890 -130 -740 -130 {
lab=gnda}
N -850 -130 -850 530 {
lab=gnda}
N -850 510 470 520 {
lab=gnda}
N -740 -130 -380 -130 {
lab=gnda}
N -750 -150 -380 -150 {
lab=d1b}
N -590 250 -380 250 {
lab=d1b}
N -600 -150 -580 250 {
lab=d1b}
C {xschem/6bitdac_v2.sym} -230 -100 0 0 {name=x1}
C {xschem/6bitdac_v2.sym} -230 300 0 0 {name=x2}
C {xschem/TG2.sym} 130 -90 0 0 {name=x3}
C {ipin.sym} -730 -250 0 0 {name=p1 lab=vref_top}
C {ipin.sym} -730 -230 0 0 {name=p2 lab=d0}
C {ipin.sym} -730 -210 0 0 {name=p3 lab=d0b}
C {ipin.sym} -730 -190 0 0 {name=p4 lab=vdd}
C {ipin.sym} -730 -170 0 0 {name=p5 lab=d1}
C {ipin.sym} -730 -130 0 0 {name=p7 lab=gnda}
C {ipin.sym} -740 -110 0 0 {name=p8 lab=d4b}
C {ipin.sym} -740 -90 0 0 {name=p9 lab=d2b}
C {ipin.sym} -750 -70 0 0 {name=p10 lab=d5b}
C {ipin.sym} -750 -50 0 0 {name=p11 lab=d4}
C {ipin.sym} -750 -30 0 0 {name=p12 lab=d5}
C {ipin.sym} -750 -10 0 0 {name=p13 lab=d3b}
C {ipin.sym} -740 10 0 0 {name=p14 lab=d2}
C {ipin.sym} -740 30 0 0 {name=p15 lab=d3}
C {lab_pin.sym} -80 -220 0 0 {name=p17 sig_type=std_logic lab=upper_out}
C {lab_pin.sym} -70 70 0 0 {name=p18 sig_type=std_logic lab=lower_out}
C {ipin.sym} -50 -90 0 0 {name=p19 lab=d6b}
C {ipin.sym} -50 -70 0 0 {name=p20 lab=d6}
C {opin.sym} 320 -110 0 0 {name=p21 lab=v_out}
C {lab_pin.sym} -380 70 0 0 {name=p16 sig_type=std_logic lab=mid_node}
C {ipin.sym} -740 -150 0 0 {name=p6 lab=d1b}
C {ipin.sym} -670 450 0 0 {name=p22 lab=vref_bottom}
