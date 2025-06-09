v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -110 40 -110 100 {lab=GND}
N -110 -40 -110 -20 {lab=vnmic}
N -110 -40 -20 -40 {lab=vnmic}
N 40 -40 100 -40 {lab=vn1}
N 160 -40 210 -40 {lab=vn2}
N 270 -40 320 -40 {lab=#net1}
N 320 -40 350 -40 {lab=#net1}
N 350 -40 380 -40 {lab=#net1}
N 330 -170 380 -170 {lab=#net1}
N 330 -240 380 -240 {lab=#net1}
N 330 -240 330 -170 {lab=#net1}
N 440 -170 480 -170 {lab=vout}
N 480 -170 490 -170 {lab=vout}
N 440 -240 490 -240 {lab=vout}
N 330 -170 330 -130 {lab=#net1}
N 330 -130 330 -40 {lab=#net1}
N 400 70 400 120 {lab=GND}
N 600 -120 600 -20 {lab=vout}
N 600 40 600 150 {lab=GND}
N 510 0 510 70 {lab=GND}
N 560 -120 600 -120 {lab=vout}
N 400 -60 400 10 {lab=vcm}
N 380 -40 470 -40 {lab=#net1}
N 400 -80 400 -60 {lab=vcm}
N 400 -80 480 -80 {lab=vcm}
N 510 -30 510 -0 {lab=GND}
N 490 -170 510 -170 {lab=vout}
N 510 -170 510 -90 {lab=vout}
N 490 -240 510 -240 {lab=vout}
N 510 -240 510 -170 {lab=vout}
N 510 -120 560 -120 {lab=vout}
C {vsource.sym} -110 10 0 0 {name=Vmic value="0 AC 1" savecurrent=false}
C {res.sym} 10 -40 3 0 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {res.sym} 240 -40 3 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {capa.sym} 130 -40 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -110 100 0 0 {name=l1 lab=GND}
C {vsource.sym} 400 40 0 0 {name=V2 value=1.5 savecurrent=false}
C {capa.sym} 410 -240 3 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {res.sym} 410 -170 3 0 {name=R3
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} 600 10 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 400 120 0 0 {name=l2 lab=GND}
C {gnd.sym} 510 70 0 0 {name=l3 lab=GND}
C {gnd.sym} 600 150 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -60 -40 1 0 {name=p1 sig_type=std_logic lab=vnmic}
C {lab_pin.sym} 70 -40 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} 190 -40 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} 400 -10 0 0 {name=p4 sig_type=std_logic lab=vcm}
C {lab_pin.sym} 590 -120 1 0 {name=p5 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} 720 -340 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL
  save all
  op
  write mic1.raw
  set appendwrite
  AC DEC 100 0.1 10e6
  write mic1.raw
  **
  plot db(vout)
  plot 180/pi*phase(vout)
  MEAS AC gain_db MAX vdb(vout) FROM=0.1 TO=10e6
  LET vm3db = gain_db - 3.0
  print vm3db
  MEAS AC fzero WHEN vdb(vout)=vm3db RISE=1
  MEAS AC fpole WHEN vdb(vout)=vm3db FALL=1
  MEAS AC fmid  WHEN vdb(vout)=gain_db
  **Phase Measurement
  LET phase_deg = cph(vout)*180/PI
  MEAS AC phase_zero FIND phase_deg AT=fzero
  MEAS AC phase_pole FIND phase_deg AT=fpole
  MEAS AC phase_mid  FIND phase_deg AT=fmid
  ** MEAS fero fpole using phase
  LET phase_zero_ph = phase_mid-45
  MEAS AC fzero_ph WHEN phase_deg=phase_zero_ph
  **
  TRAN 1u 5m
"}
C {vcvs.sym} 510 -60 0 0 {name=E1 value=1000
}
