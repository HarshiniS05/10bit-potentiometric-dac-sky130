v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -1210 -700 -660 -700 {
lab=vref_top}
N -1210 -680 -660 -680 {
lab=d0}
N -1220 -660 -660 -660 {
lab=d0b}
N -1220 -640 -660 -640 {
lab=vdd}
N -1220 -620 -660 -620 {
lab=d1}
N -1220 -600 -660 -600 {
lab=d1b}
N -1230 -580 -660 -580 {
lab=gnda}
N -1210 -560 -660 -560 {
lab=d4b}
N -1220 -540 -660 -540 {
lab=d6b}
N -1200 -520 -660 -520 {
lab=d2b}
N -1200 -500 -660 -500 {
lab=d5b}
N -1200 -480 -660 -480 {
lab=d6}
N -1230 -460 -660 -460 {
lab=d7b}
N -1240 -440 -660 -440 {
lab=d4}
N -1240 -420 -660 -420 {
lab=d7}
N -1250 -400 -660 -400 {
lab=d5}
N -1250 -380 -660 -380 {
lab=d3b}
N -1240 -360 -660 -360 {
lab=d2}
N -1240 -340 -660 -340 {
lab=d3}
N -680 -680 -680 -140 {
lab=d0}
N -680 -150 -650 -140 {
lab=d0}
N -700 -120 -650 -120 {
lab=d0b}
N -700 -660 -690 -120 {
lab=d0b}
N -740 -100 -650 -100 {
lab=vdd}
N -780 -80 -650 -80 {
lab=d1}
N -750 -620 -750 -80 {
lab=d1}
N -720 -640 -720 -100 {
lab=vdd}
N -810 -60 -650 -60 {
lab=d1b}
N -800 -600 -800 -60 {
lab=d1b}
N -840 -40 -650 -40 {
lab=gnda}
N -830 -580 -830 -40 {
lab=gnda}
N -860 -560 -860 -20 {
lab=d4b}
N -860 -20 -650 -20 {
lab=d4b}
N -890 -0 -650 0 {
lab=d6b}
N -880 -540 -880 0 {
lab=d6b}
N -920 20 -650 20 {
lab=d2b}
N -900 -520 -900 20 {
lab=d2b}
N -940 40 -650 40 {
lab=d5b}
N -940 -500 -930 40 {
lab=d5b}
N -970 60 -640 60 {
lab=d6}
N -970 -480 -960 60 {
lab=d6}
N -1000 80 -640 80 {
lab=d7b}
N -990 -460 -980 80 {
lab=d7b}
N -1030 100 -650 100 {
lab=d4}
N -1010 -440 -1010 100 {
lab=d4}
N -1070 120 -650 120 {
lab=d7}
N -1110 140 -650 140 {
lab=d5}
N -1060 120 -1050 -420 {
lab=d7}
N -1100 140 -1080 -400 {
lab=d5}
N -1160 160 -650 160 {
lab=d3b}
N -1130 160 -1110 -380 {
lab=d3b}
N -1190 180 -650 180 {
lab=d2}
N -1180 -360 -1180 180 {
lab=d2}
N -660 -320 -660 -250 {
lab=mid_node}
N -660 -250 -650 -160 {
lab=mid_node}
N -350 -250 -350 -160 {
lab=lower_out}
N -360 -650 -360 -560 {
lab=upper_out}
N -360 -570 -300 -560 {
lab=upper_out}
N -340 -580 -300 -580 {
lab=lower_out}
N -350 -250 -330 -580 {
lab=lower_out}
N -310 -540 -300 -540 {
lab=d8b}
N -310 -520 -300 -520 {
lab=d8}
N -360 -700 -360 -650 {
lab=upper_out}
N 0 -580 130 -580 {
lab=gnda}
N 110 -580 110 480 {
lab=gnda}
N -300 -500 -300 300 {
lab=vdd}
N -1360 270 -300 270 {
lab=vdd}
N -1340 -640 -1340 270 {
lab=vdd}
N -1230 200 -650 200 {
lab=d3}
N -1220 -340 -1220 200 {
lab=d3}
N -1450 -580 -1450 270 {
lab=gnda}
N -1450 220 -650 220 {
lab=gnda}
N 0 -560 20 -560 {
lab=v_out}
N -1340 -630 -1220 -640 {
lab=vdd}
N -1500 -580 -1220 -580 {
lab=gnda}
N -1410 410 110 410 {
lab=gnda}
N -1400 -580 -1400 410 {
lab=gnda}
C {xschem/8bitdac_v2.sym} -510 -510 0 0 {name=x1}
C {xschem/8bitdac_v2.sym} -500 30 0 0 {name=x2}
C {xschem/TG2.sym} -150 -540 0 0 {name=x3}
C {ipin.sym} -1210 -700 0 0 {name=p1 lab=vref_top}
C {ipin.sym} -1210 -680 0 0 {name=p2 lab=d0}
C {ipin.sym} -1220 -660 0 0 {name=p3 lab=d0b}
C {ipin.sym} -1210 -640 0 0 {name=p4 lab=vdd}
C {ipin.sym} -1210 -620 0 0 {name=p5 lab=d1}
C {ipin.sym} -1210 -600 0 0 {name=p6 lab=d1b}
C {ipin.sym} -1210 -580 0 0 {name=p7 lab=gnda}
C {ipin.sym} -1210 -560 0 0 {name=p8 lab=d4b}
C {ipin.sym} -1210 -540 0 0 {name=p9 lab=d6b}
C {ipin.sym} -1200 -520 0 0 {name=p10 lab=d2b}
C {ipin.sym} -1200 -500 0 0 {name=p11 lab=d5b}
C {ipin.sym} -1200 -480 0 0 {name=p12 lab=d6}
C {ipin.sym} -1230 -460 0 0 {name=p13 lab=d7b}
C {ipin.sym} -1240 -440 0 0 {name=p14 lab=d4}
C {ipin.sym} -1240 -420 0 0 {name=p15 lab=d7}
C {ipin.sym} -1240 -400 0 0 {name=p16 lab=d5}
C {ipin.sym} -1240 -380 0 0 {name=p17 lab=d3b}
C {ipin.sym} -1240 -360 0 0 {name=p18 lab=d2}
C {ipin.sym} -1240 -340 0 0 {name=p19 lab=d3}
C {lab_pin.sym} -660 -250 0 0 {name=p20 sig_type=std_logic lab=mid_node}
C {lab_pin.sym} -360 -650 0 0 {name=p21 sig_type=std_logic lab=upper_out}
C {lab_pin.sym} -350 -250 0 0 {name=p22 sig_type=std_logic lab=lower_out}
C {ipin.sym} -310 -540 0 0 {name=p23 lab=d8b}
C {ipin.sym} -310 -520 0 0 {name=p24 lab=d8}
C {opin.sym} 20 -560 0 0 {name=p25 lab=v_out}
