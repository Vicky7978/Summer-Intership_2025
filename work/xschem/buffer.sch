v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -60 -70 -60 -30 {lab=#net1}
N -60 -70 70 -70 {lab=#net1}
N 130 -70 490 -70 {lab=#net2}
N 490 -70 490 -20 {lab=#net2}
N -60 30 -60 80 {lab=#net3}
N -60 80 490 80 {lab=#net3}
N 490 20 490 80 {lab=#net3}
N 250 -70 250 -30 {lab=#net2}
N 250 20 250 80 {lab=#net3}
N -100 -60 -100 -20 {lab=vip}
N -140 -60 -100 -60 {lab=vip}
N -100 20 -100 80 {lab=vim}
N -140 80 -100 80 {lab=vim}
N 530 30 600 30 {lab=vom}
N 600 30 600 80 {lab=vom}
N 530 -30 590 -30 {lab=vop}
N 590 -70 590 -30 {lab=vop}
C {vcvs.sym} -60 0 0 0 {name=E1 value=1}
C {res.sym} 100 -70 3 0 {name=R1
value=15.9k
footprint=1206
device=resistor
m=1}
C {capa.sym} 250 -10 0 0 {name=C1
m=1
value=10n
footprint=1206
device="ceramic capacitor"}
C {vcvs.sym} 530 0 0 0 {name=E2 value=1}
C {ipin.sym} 590 -70 2 0 {name=p1 lab=vop}
C {ipin.sym} 600 80 2 0 {name=p2 lab=vom}
C {ipin.sym} -140 80 0 0 {name=p3 lab=vim}
C {ipin.sym} -140 -60 0 0 {name=p4 lab=vip}
