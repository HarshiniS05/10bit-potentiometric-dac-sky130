v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -370 -70 -370 -0 {
lab=tab_a}
N -370 60 -370 120 {
lab=tab_b}
N -370 180 -370 240 {
lab=tab_c}
N -370 -160 -370 -130 {
lab=VREF1}
N -370 90 -350 90 {
lab=tab_b}
N -370 210 -250 210 {
lab=tab_c}
N -370 300 -370 350 {
lab=gnda}
N -370 350 60 350 {
lab=gnda}
N -370 350 440 350 {
lab=gnda}
N -370 -40 -330 -40 {
lab=tab_a}
N -350 -60 -330 -60 {
lab=tab_b}
N -350 -60 -350 90 {
lab=tab_b}
N -460 -20 -330 -20 {
lab=d0b}
N -480 20 -330 20 {
lab=vdd}
N -30 -60 10 -60 {
lab=gnda}
N 0 -60 0 350 {
lab=gnda}
N -30 -40 -30 50 {
lab=node_A}
N -330 -0 -320 -110 {
lab=d0}
N -370 90 -350 90 {
lab=tab_b}
N -460 -20 -460 110 {
lab=d0b}
N -460 110 -330 110 {
lab=d0b}
N -330 150 -330 200 {
lab=vdd}
N -470 200 -330 200 {
lab=vdd}
N -480 20 -470 200 {
lab=vdd}
N -30 70 -10 70 {
lab=gnda}
N -10 70 -10 350 {
lab=gnda}
N -30 90 -30 190 {
lab=node_B}
N 40 -80 130 -80 {
lab=node_A}
N 50 -80 50 60 {
lab=node_A}
N -30 50 50 50 {
lab=node_A}
N -30 190 90 190 {
lab=node_B}
N 60 -100 130 -100 {
lab=node_B}
N 60 -100 60 190 {
lab=node_B}
N 110 -40 130 -40 {
lab=d1}
N 120 -40 120 50 {
lab=d1}
N 70 -60 130 -60 {
lab=d1b}
N 100 -60 100 100 {
lab=d1b}
N 430 -80 440 -80 {
lab=v_out}
N 430 -100 540 -100 {
lab=gnda}
N 430 350 510 -100 {
lab=gnda}
N 130 -20 130 290 {
lab=vdd}
N -480 20 -480 320 {
lab=vdd}
N -480 310 130 280 {
lab=vdd}
N -320 -110 -240 -110 {
lab=d0}
N -240 -110 -240 130 {
lab=d0}
N -330 130 -240 120 {
lab=d0}
N -340 90 -330 90 {}
N -340 90 -340 210 {}
N -360 70 -330 70 {}
N -360 70 -360 350 {}
C {res.sym} -370 -100 0 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {res.sym} -370 30 0 0 {name=R2
value=500
footprint=1206
device=resistor
m=1}
C {res.sym} -370 150 0 0 {name=R3
value=500
footprint=1206
device=resistor
m=1}
C {res.sym} -370 270 0 0 {name=R4
value=500
footprint=1206
device=resistor
m=1}
C {ipin.sym} -370 -160 0 0 {name=p1 lab=VREF1}
C {ipin.sym} -370 350 0 0 {name=p2 lab=gnda}
C {lab_pin.sym} -370 -40 0 0 {name=p3 sig_type=std_logic lab=tab_a}
C {lab_pin.sym} -370 90 0 0 {name=p4 sig_type=std_logic lab=tab_b}
C {lab_pin.sym} -370 210 0 0 {name=p5 sig_type=std_logic lab=tab_c}
C {ipin.sym} -320 -110 0 0 {name=p6 lab=d0}
C {ipin.sym} -460 -20 0 0 {name=p7 lab=d0b}
C {ipin.sym} -470 20 0 0 {name=p8 lab=vdd}
C {lab_pin.sym} -30 50 0 0 {name=p9 sig_type=std_logic lab=node_A}
C {lab_pin.sym} -30 190 0 0 {name=p10 sig_type=std_logic lab=node_B}
C {ipin.sym} 120 50 0 0 {name=p11 lab=d1}
C {opin.sym} 440 -80 0 0 {name=p13 lab=v_out}
C {ipin.sym} 100 100 0 0 {name=p12 lab=d1b}
C {xschem/TG2.sym} -180 -20 0 0 {name=x1}
C {xschem/TG2.sym} -180 110 0 0 {name=x2}
C {xschem/TG2.sym} 280 -60 0 0 {name=x3}
