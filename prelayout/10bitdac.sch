v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -1100 -310 -190 -310 {
lab=vref_top}
N -1090 -290 -190 -290 {
lab=d0}
N -1100 -270 -190 -270 {
lab=d0b}
N -1090 -250 -190 -250 {
lab=vdd}
N -1100 -230 -190 -230 {
lab=d1}
N -1100 -210 -190 -210 {
lab=d1b}
N -1100 -190 -190 -190 {
lab=gnda}
N -1100 -170 -190 -170 {
lab=d4b}
N -1090 -150 -190 -150 {
lab=d6b}
N -1090 -130 -190 -130 {
lab=d8b}
N -1100 -110 -190 -110 {
lab=d8}
N -1110 -90 -190 -90 {
lab=d2b}
N -1110 -70 -190 -70 {
lab=d5b}
N -1110 -50 -180 -50 {
lab=d6}
N -1100 -30 -190 -30 {
lab=d7b}
N -1110 -10 -190 -10 {
lab=d4}
N -1100 10 -190 10 {
lab=d7}
N -1100 30 -190 30 {
lab=d5}
N -1110 50 -190 50 {
lab=d3b}
N -1110 70 -190 70 {
lab=d2}
N -1120 90 -190 90 {
lab=d3}
N -240 290 -190 290 {
lab=d0}
N -230 -290 -230 290 {
lab=d0}
N -260 310 -190 310 {
lab=d0b}
N -250 -270 -250 310 {
lab=d0b}
N -280 330 -190 330 {
lab=vdd}
N -310 350 -190 350 {
lab=d1}
N -340 370 -190 370 {
lab=d1b}
N -270 -250 -270 330 {
lab=vdd}
N -290 -230 -290 350 {
lab=d1}
N -330 -210 -330 370 {
lab=d1b}
N -370 390 -190 390 {
lab=gnda}
N -360 -190 -360 390 {
lab=gnda}
N -400 410 -190 410 {
lab=d4b}
N -390 -170 -390 410 {
lab=d4b}
N -420 430 -190 430 {
lab=d6b}
N -410 -150 -410 430 {
lab=d6b}
N -450 450 -190 450 {
lab=d8b}
N -440 450 -430 -130 {
lab=d8b}
N -480 470 -190 470 {
lab=d8}
N -470 -110 -470 470 {
lab=d8}
N -500 490 -190 490 {
lab=d2b}
N -490 -90 -490 490 {
lab=d2b}
N -520 510 -190 510 {
lab=d5b}
N -510 -70 -510 510 {
lab=d5b}
N -540 530 -190 530 {
lab=d6}
N -530 -50 -530 530 {
lab=d6}
N -570 550 -190 550 {
lab=d7b}
N -560 550 -550 -30 {
lab=d7b}
N -600 570 -190 570 {
lab=d4}
N -590 570 -580 -10 {
lab=d4}
N -630 590 -190 590 {
lab=d7}
N -610 590 -600 10 {
lab=d7}
N -660 610 -190 610 {
lab=d5}
N -650 610 -640 30 {
lab=d5}
N -690 630 -190 630 {
lab=d3b}
N -680 630 -670 50 {
lab=d3b}
N -730 650 -190 650 {
lab=d2}
N -720 70 -720 650 {
lab=d2}
N -780 670 -190 670 {
lab=d3}
N -770 90 -770 670 {
lab=d3}
N -890 -190 -890 710 {
lab=gnda}
N -890 690 -190 690 {
lab=gnda}
N -190 110 -190 180 {
lab=mid_node}
N -190 180 -190 270 {
lab=mid_node}
N 110 -310 180 -310 {
lab=upper_out}
N 180 -330 180 -200 {
lab=upper_out}
N 110 270 190 270 {
lab=lower_out}
N 160 -110 250 -110 {
lab=upper_out}
N 180 -200 180 -110 {
lab=upper_out}
N 110 -130 250 -130 {
lab=lower_out}
N 140 -130 140 110 {
lab=lower_out}
N 140 110 140 270 {
lab=lower_out}
N -1050 -250 -1050 820 {
lab=vdd}
N 250 -50 250 820 {
lab=vdd}
N -1050 780 250 780 {
lab=vdd}
N 550 -130 920 -130 {
lab=gnda}
N 820 -130 820 810 {
lab=gnda}
N -970 -190 -970 760 {
lab=gnda}
N -970 740 820 750 {
lab=gnda}
N 200 -90 250 -90 {
lab=d9b}
N 200 -70 250 -70 {
lab=d9}
N 550 -110 600 -110 {}
C {xschem/9bitdac_v2.sym} -40 -100 0 0 {name=x1}
C {xschem/9bitdac_v2.sym} -40 480 0 0 {name=x2}
C {ipin.sym} -1090 -310 0 0 {name=p1 lab=vref_top}
C {ipin.sym} -1090 -290 0 0 {name=p2 lab=d0}
C {ipin.sym} -1090 -270 0 0 {name=p3 lab=d0b}
C {ipin.sym} -1090 -250 0 0 {name=p4 lab=vdd}
C {ipin.sym} -1090 -230 0 0 {name=p5 lab=d1}
C {ipin.sym} -1090 -210 0 0 {name=p6 lab=d1b}
C {ipin.sym} -1090 -190 0 0 {name=p7 lab=gnda}
C {ipin.sym} -1090 -170 0 0 {name=p8 lab=d4b}
C {ipin.sym} -1080 -150 0 0 {name=p9 lab=d6b}
C {ipin.sym} -1080 -130 0 0 {name=p10 lab=d8b}
C {ipin.sym} -1100 -110 0 0 {name=p11 lab=d8}
C {ipin.sym} -1100 -90 0 0 {name=p12 lab=d2b}
C {ipin.sym} -1100 -70 0 0 {name=p13 lab=d5b}
C {ipin.sym} -1100 -50 0 0 {name=p14 lab=d6}
C {ipin.sym} -1100 -30 0 0 {name=p15 lab=d7b}
C {ipin.sym} -1100 -10 0 0 {name=p16 lab=d4}
C {ipin.sym} -1090 10 0 0 {name=p17 lab=d7}
C {ipin.sym} -1090 30 0 0 {name=p18 lab=d5}
C {ipin.sym} -1100 50 0 0 {name=p19 lab=d3b}
C {ipin.sym} -1100 70 0 0 {name=p20 lab=d2}
C {ipin.sym} -1110 90 0 0 {name=p21 lab=d3}
C {lab_pin.sym} -190 180 0 0 {name=p22 sig_type=std_logic lab=mid_node}
C {xschem/TG2.sym} 400 -90 0 0 {name=x3}
C {lab_pin.sym} 180 -200 0 0 {name=p23 sig_type=std_logic lab=upper_out}
C {lab_pin.sym} 140 110 0 0 {name=p24 sig_type=std_logic lab=lower_out}
C {ipin.sym} 200 -90 0 0 {name=p25 lab=d9b}
C {ipin.sym} 210 -70 0 0 {name=p26 lab=d9}
C {opin.sym} 600 -110 0 0 {name=p27 lab=v_out}
