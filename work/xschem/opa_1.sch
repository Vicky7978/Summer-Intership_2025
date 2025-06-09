v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -30 -20 30 -20 {lab=vip}
N -30 20 30 20 {lab=vim}
N 70 -50 70 -30 {lab=vop}
N 70 -50 110 -50 {lab=vop}
N 70 30 70 60 {lab=vop}
N 70 60 120 60 {lab=vop}
C {vcvs.sym} 70 0 0 0 {name=E1 value=1000}
C {iopin.sym} 110 -50 0 0 {name=p1 lab=vop}
C {iopin.sym} 120 60 0 0 {name=p2 lab=vom}
C {iopin.sym} -30 -20 2 0 {name=p3 lab=vip}
C {iopin.sym} -30 20 2 0 {name=p4 lab=vim
}
