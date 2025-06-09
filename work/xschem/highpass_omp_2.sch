v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -60 -20 -0 -20 {lab=#net1}
N -210 -20 -210 30 {lab=vin}
N -210 -20 -150 -20 {lab=vin}
N -150 -20 -120 -20 {lab=vin}
N 140 -170 200 -170 {lab=#net2}
N 140 -170 140 -20 {lab=#net2}
N 260 -170 320 -170 {lab=vout}
N -210 90 -210 220 {lab=#net3}
N -210 220 260 220 {lab=#net3}
N 110 150 110 250 {lab=GND}
N 60 -20 120 -20 {lab=#net2}
N 110 70 110 90 {lab=vcm}
N 320 -170 340 -170 {lab=vout}
N 110 50 110 70 {lab=vcm}
N 110 30 110 50 {lab=vcm}
N 340 -170 380 -170 {lab=vout}
N 260 100 260 220 {lab=#net3}
N 110 20 110 30 {lab=vcm}
N 110 20 210 20 {lab=vcm}
N 380 -170 380 0 {lab=vout}
N 120 -20 190 -20 {lab=#net2}
N 190 -20 190 -10 {lab=#net2}
N 190 -10 230 -10 {lab=#net2}
N 210 10 210 20 {lab=vcm}
N 210 10 220 10 {lab=vcm}
N 260 100 290 100 {lab=#net3}
N 290 50 290 100 {lab=#net3}
N 380 -0 380 10 {lab=vout}
N 360 10 380 10 {lab=vout}
C {capa.sym} -90 -20 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} 30 -20 3 0 {name=R1
value=5k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -210 60 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {vsource.sym} 110 120 0 0 {name=V2 value=1.5 savecurrent=false}
C {res.sym} 230 -170 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 110 250 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -210 0 0 0 {name=p1 sig_type=std_logic lab=vin
}
C {lab_wire.sym} 110 80 0 0 {name=p2 sig_type=std_logic lab=vcm
}
C {lab_wire.sym} 380 -30 2 0 {name=p3 sig_type=std_logic lab=vout
}
C {simulator_commands_shown.sym} -880 -220 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
op
ac dec 100 0.1 100k
plot vdb(vout)
plot 180/pi*phase(vout)
write highpass_omp.raw
**
meas ac gain_db MAX vdb(vout) FROM=0.1 TO=10e6
let vm3db = gain_db - 3
print vm3db
meas ac fzero when vdb(vout)=vm3db RISE=1
meas ac fpole when vdb(vout)=vm3db FALL=1
meas ac f3db when vdb(vout)= gain_db

**phase management
let phase_deg=cph(vout)*180/pi
meas ac phase_zero FIND phase_deg AT = fzero
meas ac phase_pole FIND phase_deg AT = fpole
meas ac phase_margin FIND phase_deg at= f3db

tran 1u 5m
.ENDC
"}
C {buffer.sym} 290 20 0 0 {name=x1}
