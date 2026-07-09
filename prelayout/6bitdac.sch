v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -510 -360 -340 -360 {
lab=vref_top}
N -510 -340 -340 -340 {
lab=d0}
N -510 -320 -340 -320 {
lab=d0b}
N -510 -300 -340 -300 {
lab=vdd}
N -510 -280 -340 -280 {
lab=d1}
N -510 -260 -340 -260 {
lab=d1b}
N -510 -240 -340 -240 {
lab=gnda}
N -510 -220 -340 -220 {
lab=d4}
N -510 -200 -340 -200 {
lab=d2b}
N -520 -180 -340 -180 {
lab=d4}
N -520 -160 -340 -160 {
lab=d3b}
N -520 -140 -340 -140 {
lab=d2}
N -520 -120 -340 -120 {
lab=d3}
N -530 -100 -340 -100 {
lab=mid_node}
N -350 -340 -350 40 {
lab=d0}
N -360 -320 -360 70 {
lab=d0b}
N -360 60 -340 60 {
lab=d0b}
N -370 -300 -370 90 {
lab=vdd}
N -370 80 -340 80 {
lab=vdd}
N -390 -280 -390 110 {
lab=d1}
N -390 100 -340 100 {
lab=d1}
N -400 -260 -400 130 {
lab=d1b}
N -400 120 -340 120 {
lab=d1b}
N -420 -240 -420 150 {
lab=gnda}
N -420 140 -340 140 {
lab=gnda}
N -430 -220 -430 170 {
lab=d4}
N -430 160 -340 160 {
lab=d4}
N -450 -200 -450 190 {
lab=d2b}
N -450 180 -340 180 {
lab=d2b}
N -470 -180 -470 210 {
lab=d4}
N -470 200 -340 200 {
lab=d4}
N -480 -160 -480 230 {
lab=d3b}
N -480 220 -340 220 {
lab=d3b}
N -500 -140 -500 250 {
lab=d2}
N -500 240 -340 240 {
lab=d2}
N -510 -120 -510 270 {
lab=d3}
N -510 260 -340 260 {
lab=d3}
N -530 -100 -530 20 {
lab=mid_node}
N -530 10 -340 20 {
lab=mid_node}
N -350 30 -340 40 {
lab=d0}
N -40 -360 -10 -360 {
lab=upper_out}
N -20 -360 -20 -310 {
lab=upper_out}
N -40 20 0 20 {
lab=lower_out}
N -10 -70 -10 20 {
lab=lower_out}
N -20 -310 -20 -210 {
lab=upper_out}
N -20 -220 40 -210 {
lab=upper_out}
N -40 -230 40 -230 {
lab=lower_out}
N -30 -230 -10 -70 {
lab=lower_out}
N 20 -190 40 -190 {
lab=d5b}
N 20 -170 40 -170 {
lab=d5}
N 340 -210 370 -210 {
lab=v_out}
N -840 -240 -510 -240 {
lab=gnda}
N -680 -490 -680 -240 {
lab=gnda}
N 340 -470 340 -230 {
lab=gnda}
N -680 -440 340 -440 {
lab=gnda}
N -620 -300 -620 430 {
lab=vdd}
N -440 -240 -440 290 {
lab=gnda}
N -440 280 -340 280 {
lab=gnda}
N 0 -150 40 -150 {
lab=vdd}
N -620 -280 -510 -300 {
lab=vdd}
N 20 -150 20 440 {
lab=vdd}
N -620 380 20 380 {
lab=vdd}
C {xschem/TG2.sym} 190 -190 0 0 {name=x3}
C {ipin.sym} -510 -360 0 0 {name=p1 lab=vref_top}
C {ipin.sym} -510 -340 0 0 {name=p2 lab=d0}
C {ipin.sym} -510 -320 0 0 {name=p3 lab=d0b}
C {ipin.sym} -510 -300 0 0 {name=p4 lab=vdd}
C {ipin.sym} -510 -280 0 0 {name=p5 lab=d1}
C {ipin.sym} -510 -260 0 0 {name=p6 lab=d1b}
C {ipin.sym} -510 -220 0 0 {name=p7 lab=d4b}
C {ipin.sym} -510 -200 0 0 {name=p8 lab=d2b}
C {ipin.sym} -520 -180 0 0 {name=p9 lab=d4}
C {ipin.sym} -520 -160 0 0 {name=p10 lab=d3b}
C {ipin.sym} -510 -240 0 0 {name=p11 lab=gnda}
C {ipin.sym} -520 -140 0 0 {name=p12 lab=d2}
C {ipin.sym} -520 -120 0 0 {name=p13 lab=d3}
C {ipin.sym} 20 -190 0 0 {name=p14 lab=d5b}
C {lab_pin.sym} -530 -100 0 0 {name=p15 sig_type=std_logic lab=mid_node}
C {lab_pin.sym} -20 -310 0 0 {name=p16 sig_type=std_logic lab=upper_out}
C {lab_pin.sym} -10 -70 0 0 {name=p17 sig_type=std_logic lab=lower_out}
C {ipin.sym} 20 -170 0 0 {name=p18 lab=d5}
C {opin.sym} 370 -210 0 0 {name=p19 lab=v_out
}
C {xschem/5bitdac_v2.sym} -190 -230 0 0 {name=x1}
C {xschem/5bitdac_v2.sym} -190 150 0 0 {name=x2}
