v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -670 -260 -200 -260 {
lab=vref_top}
N -670 -240 -200 -240 {
lab=d0}
N -670 -220 -200 -220 {
lab=d0b}
N -670 -200 -200 -200 {
lab=vdd}
N -660 -180 -200 -180 {
lab=d1}
N -670 -160 -200 -160 {
lab=d1b}
N -690 -140 -200 -140 {
lab=gnda}
N -690 -120 -200 -120 {
lab=d4b}
N -690 -100 -200 -100 {
lab=d6b}
N -680 -80 -200 -80 {
lab=d2b}
N -690 -60 -200 -60 {
lab=d5b}
N -700 -40 -200 -40 {
lab=d6}
N -710 -20 -200 -20 {
lab=d4}
N -700 -0 -200 0 {
lab=d5}
N -710 20 -200 20 {
lab=d3b}
N -710 40 -200 40 {
lab=d2}
N -710 60 -200 60 {
lab=d3}
N -250 210 -200 210 {
lab=d0}
N -230 -240 -230 210 {
lab=d0}
N -260 230 -250 -220 {
lab=d0b}
N -390 290 -200 290 {
lab=d1b}
N -370 290 -360 -160 {
lab=d1b}
N -430 -140 -430 310 {
lab=gnda}
N -510 330 -200 330 {
lab=d4b}
N -510 -120 -490 330 {
lab=d4b}
N -550 350 -200 350 {
lab=d6b}
N -540 -100 -540 350 {
lab=d6b}
N -600 370 -200 370 {
lab=d2b}
N -580 -80 -580 370 {
lab=d2b}
N -640 390 -200 390 {
lab=d5b}
N -620 -60 -620 390 {
lab=d5b}
N -680 410 -200 410 {
lab=d6}
N -650 -40 -650 410 {
lab=d6}
N -710 430 -200 430 {
lab=d4}
N -700 430 -680 -20 {
lab=d4}
N -430 300 -200 310 {
lab=gnda}
N -470 450 -200 450 {
lab=d5}
N -470 -0 -460 450 {
lab=d5}
N -420 490 -200 490 {
lab=d2}
N -410 490 -400 40 {
lab=d2}
N -560 -140 -560 540 {
lab=gnda}
N -560 530 -200 530 {
lab=gnda}
N -360 510 -200 510 {
lab=d3}
N -340 60 -340 510 {
lab=d3}
N -320 470 -200 470 {
lab=d3b}
N -310 20 -310 470 {
lab=d3b}
N -200 80 -200 130 {
lab=mid_node}
N -200 130 -200 190 {
lab=mid_node}
N 100 -260 100 -230 {
lab=upper_out}
N 100 190 110 120 {
lab=lower_out}
N 100 -230 100 -60 {
lab=upper_out}
N 100 -70 140 -60 {
lab=upper_out}
N 110 -80 140 -80 {
lab=lower_out}
N 110 120 120 -80 {
lab=lower_out}
N 110 -40 140 -40 {
lab=d7b}
N 100 -20 140 -20 {
lab=d7}
N 140 -0 140 610 {
lab=vdd}
N 440 -80 540 -80 {
lab=gnda}
N 520 -80 520 640 {
lab=gnda}
N -920 -140 -690 -140 {
lab=gnda}
N -900 -140 -900 630 {
lab=gnda}
N -900 620 520 630 {
lab=gnda}
N 440 -60 470 -60 {
lab=v_out}
N -980 -200 -670 -200 {
lab=vdd}
N -1000 580 140 580 {
lab=vdd}
N -960 580 -950 -200 {
lab=vdd}
N -600 270 -200 270 {
lab=d1}
N -610 -180 -590 270 {
lab=d1}
N -270 230 -200 230 {
lab=d0b}
N -300 250 -200 250 {
lab=vdd}
N -290 250 -280 -200 {
lab=vdd}
C {xschem/7bitdac_v2.sym} -50 -90 0 0 {name=x1}
C {xschem/7bitdac_v2.sym} -50 360 0 0 {name=x2}
C {xschem/TG2.sym} 290 -40 0 0 {name=x3}
C {ipin.sym} -660 -260 0 0 {name=p1 lab=vref_top}
C {ipin.sym} -660 -240 0 0 {name=p2 lab=d0}
C {ipin.sym} -660 -220 0 0 {name=p3 lab=d0b}
C {ipin.sym} -660 -200 0 0 {name=p4 lab=vdd}
C {ipin.sym} -660 -180 0 0 {name=p5 lab=d1}
C {ipin.sym} -670 -160 0 0 {name=p6 lab=d1b}
C {ipin.sym} -680 -140 0 0 {name=p7 lab=gnda}
C {ipin.sym} -680 -120 0 0 {name=p8 lab=d4b}
C {ipin.sym} -680 -100 0 0 {name=p9 lab=d6b}
C {ipin.sym} -680 -80 0 0 {name=p10 lab=d2b}
C {ipin.sym} -690 -60 0 0 {name=p11 lab=d5b}
C {ipin.sym} -690 -40 0 0 {name=p12 lab=d6}
C {ipin.sym} -700 -20 0 0 {name=p13 lab=d4}
C {ipin.sym} -700 0 0 0 {name=p14 lab=d5}
C {ipin.sym} -700 20 0 0 {name=p15 lab=d3b}
C {ipin.sym} -700 60 0 0 {name=p17 lab=d3}
C {lab_pin.sym} -200 130 0 0 {name=p18 sig_type=std_logic lab=mid_node}
C {ipin.sym} -710 40 0 0 {name=p16 lab=d2}
C {lab_pin.sym} 100 -230 0 0 {name=p19 sig_type=std_logic lab=upper_out}
C {lab_pin.sym} 110 120 0 0 {name=p20 sig_type=std_logic lab=lower_out}
C {ipin.sym} 110 -40 0 0 {name=p21 lab=d7b}
C {ipin.sym} 100 -20 0 0 {name=p22 lab=d7}
C {opin.sym} 470 -60 0 0 {name=p23 lab=v_out}
