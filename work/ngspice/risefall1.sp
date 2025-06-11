Title : transient experiment: rise, fall, delay, period, etc.
**using variable inside the .CONTROL

**parameters
.PARAM vdd_var=1.8
.CSPARAM csvddvar=vdd_var
**RC Network
R1      vin     vout    1k
C1      vout    GND     1p

**stimuli
vsin    vin     GND     0 PULSE(0 vdd_var 1n 1p 1p 10n 20n)

**PISE/FALL 10-90
.MEASURE TRAN tr1090 TRIG v(vout) VAL='0.1*vdd_var' RISE=1 TARG v(vout) VAL='0.9*vdd_var' RISE=1
.MEASURE TRAN tf9010 TRIG v(vout) VAL='0.9*vdd_var' FALL=1 TARG v(vout) VAL='0.1*vdd_var' FALL=1

**RISE/FALL 20-80
.MEASURE TRAN tr1090 TRIG v(vout) VAL='0.2*vdd_var' RISE=1 TARG v(vout) VAL='0.8*vdd_var' RISE=1
.MEASURE TRAN tf9010 TRIG v(vout) VAL='0.8*vdd_var' FALL=1 TARG v(vout) VAL='0.2*vdd_var' FALL=1

**Delay Rise Fall
.MEASURE TRAN tdrise TRIG v(vin) VAL='0.5*vdd_var' RISE=1 TARG v(vin) VAL='0.5*vdd_var' RISE=1
.MEASURE TRAN tdfall TRIG v(vin) VAL='0.5*vdd_var' FALL=1 TARG v(vout) VAL='0.5*vdd_var' FALL=1

**Pulse width/period
.MEASURE TRAN period TRIG v(vout) VAL='0.5*vdd_var' RISE=1 TARG v(vin) VAL='0.5*vdd_var' RISE=2
.MEASURE TRAN pwidth TRIG v(vout) VAL='0.5*vdd_var' FALL=1 TARG v(vout) VAL='0.5*vdd_var' FALL=1

.CONTROL
 OP
 TRAN 10p 40n
 MEAS TRAN tr1090cs TRIG v(vout) VAL='0.1*csvddvar' RISE=1 TARG v(vout) VAL='0.9*csvddvar' RISE=1

.ENDC

.GLOBAL GND
.END
