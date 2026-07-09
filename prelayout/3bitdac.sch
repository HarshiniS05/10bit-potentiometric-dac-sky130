v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -220 -110 -130 -110 {
lab=vref_top}
N -230 30 -130 30 {
lab=gnda}
N -210 -90 -130 -90 {
lab=d0}
N -210 -70 -130 -70 {
lab=d0b}
N -220 -50 -130 -50 {
lab=vdd}
N -220 -30 -130 -30 {
lab=d1}
N -220 -10 -130 -10 {
lab=d1b}
N 170 -110 270 -110 {
lab=upper_out}
N 260 -110 260 -80 {
lab=upper_out}
N -140 -90 -140 120 {
lab=d0}
N -140 110 -130 120 {
lab=d0}
N -150 -70 -150 150 {
lab=d0b}
N -150 140 -130 140 {
lab=d0b}
N -160 -50 -160 170 {
lab=vdd}
N -160 160 -130 160 {
lab=vdd}
N -200 30 -200 250 {
lab=gnda}
N -200 240 -130 240 {
lab=gnda}
N 170 100 250 100 {
lab=lower_out}
N 240 100 240 140 {
lab=lower_out}
N 200 10 300 10 {
lab=upper_out}
N 240 140 270 140 {
lab=lower_out}
N 600 -10 640 -10 {
lab=gnda}
N 600 10 640 10 {
lab=v_out}
N 280 50 300 50 {
lab=d2}
N 280 30 300 30 {
lab=d2b}
N -370 -50 -220 -50 {
lab=vdd}
N -320 -50 -320 320 {
lab=vdd}
N 300 70 300 300 {
lab=vdd}
N -320 290 300 290 {
lab=vdd}
N -220 180 -130 180 {
lab=d1}
N -180 -30 -180 180 {
lab=d1}
N -210 10 -130 10 {
lab=mid_node}
N -210 100 -130 100 {
lab=mid_node}
N -210 10 -210 100 {
lab=mid_node}
N -190 200 -130 200 {
lab=d1b}
N -170 -10 -170 200 {
lab=d1b}
N -230 30 -230 350 {
lab=gnda}
N 620 -10 620 370 {
lab=gnda}
N -230 330 620 320 {
lab=gnda}
N 200 -10 300 -10 {
lab=lower_out}
N 260 -80 260 10 {
lab=upper_out}
N 260 140 270 -10 {
lab=lower_out}
N -200 220 -130 220 {
lab=gnda}
C {xschem/2bitdac_v2.sym} 20 170 0 0 {name=x1}
C {xschem/2bitdac_v2.sym} 20 -40 0 0 {name=x2}
C {xschem/TG2.sym} 450 30 0 0 {name=x3}
C {ipin.sym} -220 -110 0 0 {name=p1 lab=VREF1}
C {ipin.sym} -230 30 0 0 {name=p2 lab=gnda}
C {ipin.sym} -210 -50 0 0 {name=p3 lab=vdd}
C {ipin.sym} 290 30 0 0 {name=p4 lab=d2b}
C {ipin.sym} -210 -10 0 0 {name=p5 lab=d1b}
C {ipin.sym} -210 -90 0 0 {name=p6 lab=d0}
C {ipin.sym} -210 -70 0 0 {name=p7 lab=d0b}
C {ipin.sym} 280 50 0 0 {name=p8 lab=d2}
C {ipin.sym} -210 -30 0 0 {name=p9 lab=d1}
C {opin.sym} 630 10 0 0 {name=p10 lab=v_out}
C {lab_pin.sym} 240 140 0 0 {name=p12 sig_type=std_logic lab=lower_out}
C {lab_pin.sym} 260 -80 0 0 {name=p13 sig_type=std_logic lab=upper_out}
C {lab_pin.sym} -210 10 0 0 {name=p11 sig_type=std_logic lab=mid_node}
