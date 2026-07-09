v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -50 -250 -50 -170 {
lab=vout}
N 130 -110 180 -110 {
lab=vout}
N 180 -230 180 -110 {
lab=vout}
N 380 -230 380 -180 {
lab=vout}
N 600 -120 690 -120 {
lab=vout}
N 690 -230 690 -120 {
lab=vout}
N 180 -230 250 -230 {
lab=vout}
N -50 -230 250 -230 {
lab=vout}
N 250 -230 380 -230 {
lab=vout}
N 250 -230 690 -230 {
lab=vout}
N -50 -110 -50 -70 {
lab=inp1}
N 130 -200 130 -170 {
lab=inp1}
N 60 -200 130 -200 {
lab=inp1}
N 60 -200 60 -60 {
lab=inp1}
N -50 -70 60 -70 {
lab=inp1}
N 380 -120 380 -90 {
lab=inp2}
N 600 -210 600 -180 {
lab=inp2}
N 490 -210 600 -210 {
lab=inp2}
N 490 -210 490 -60 {
lab=inp2}
N 380 -90 490 -90 {
lab=inp2}
N -90 -140 -90 -0 {
lab=din}
N 560 -150 560 -0 {
lab=din}
N 250 -10 560 -10 {
lab=din}
N -90 -10 250 -10 {
lab=din}
N 90 -140 90 -30 {
lab=dinb}
N 310 -150 340 -150 {
lab=dinb}
N 310 -150 310 -50 {
lab=dinb}
N 260 -50 310 -60 {
lab=dinb}
N 90 -50 260 -50 {
lab=dinb}
N -50 -140 30 -140 {
lab=gnda}
N 30 -280 30 -140 {
lab=gnda}
N 380 -150 440 -150 {
lab=gnda}
N 440 -280 440 -150 {
lab=gnda}
N 30 -270 230 -270 {
lab=gnda}
N 230 -270 440 -270 {
lab=gnda}
N 130 -140 170 -140 {
lab=vdd}
N 170 -140 170 30 {
lab=vdd}
N 600 -150 630 -150 {
lab=vdd}
N 630 -150 630 20 {
lab=vdd}
N 450 10 630 10 {
lab=vdd}
N 170 10 450 10 {
lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} -70 -140 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad=0.3
   as=0.3
   pd=1.68
   ps=1.68
   nrd=0.3
   nrs=0.3
   sa=0
   sb=0
   sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 110 -140 0 0 {name=M2
W=1
L=0.15
nf=1
mult=1
ad=0.3
   as=0.3
   pd=1.68
   ps=1.68
   nrd=0.3
   nrs=0.3
   sa=0
   sb=0
   sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 360 -150 0 0 {name=M7
W=1
L=0.15
nf=1 
mult=1
ad=0.3
   as=0.3
   pd=1.68
   ps=1.68
   nrd=0.3
   nrs=0.3
   sa=0
   sb=0
   sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 580 -150 0 0 {name=M8
W=1
L=0.15
nf=1
mult=1
ad=0.3
   as=0.3
   pd=1.68
   ps=1.68
   nrd=0.3
   nrs=0.3
   sa=0
   sb=0
   sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 250 -10 0 0 {name=p1 lab=din}
C {devices/ipin.sym} -50 -70 0 1 {name=p2 lab=inp1}
C {devices/ipin.sym} 380 -90 0 0 {name=p3 lab=inp2}
C {devices/ipin.sym} 450 10 0 0 {name=p4 lab=vdd}
C {devices/opin.sym} 250 -230 0 0 {name=p5 lab=vout
}
C {devices/iopin.sym} 230 -270 0 0 {name=p6 lab=gnda
}
C {devices/ipin.sym} 260 -50 0 0 {name=p7 lab=dinb
}
