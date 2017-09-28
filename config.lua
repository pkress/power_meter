
-- wifi config start
myIP = ""
AP_name = "AP_name"
AP_password = "AP_password"

-- time sync
ntp_server = "129.6.15.28"

-- timers
tmr_tmp = 0
tmr_time = 1
tmr_display = 2
tmr_voltage = 3
tmr_server = 4

-- wifi config start
myIP = ""
AP_name = "W-M_Wireless"
AP_password = ""

-- time sync
ntp_server = "129.6.15.28"


-- timers
display_update_interval = 1000
voltage_update_interval = 500
time_update_interval = 500

-- PINS
dht_pin = 4

-- Display defaults
lineH = 10
vstr = ""
pstr = ""
dstr  = ""
tstr  = ""

-- Default Values and fitting values
connected=0
m=''
calibrateslope = 1.051 --slope from calibrating voltage reading on gizmo
calibrateintercept = 18.887 --mV initial voltage from calibrating voltage reading on gizmo
vadjust = (1000/1024)*2.98 --moves reading to base 10 and accounts for internal voltage divider
R = 100 --resistor used in power meter
Rstr = "R="..R.."Ohms"
responsivity = .4761 --responsivity of photodiode
respstr = "Res="..responsivity
vo = 2.5239 -- mV initial voltage in power calibration, used to calculate power
slope = 0.9707 --change in powermeter for unit change in gizmo
intercept = -0.0727 -- intercept of powermeter when gizmo reports zero
vmax = 350 --mV max value of voltage before diode begins breaking down and power/voltage readings stop being meaningful

--Power parameters. Uses above values to determine Power values from Vadc readings.
pslope = 1000*slope*calibrateslope*vadjust/(R*responsivity) --final conversion slope from Vadc to Power
pint = 1000*intercept -(slope*1000*(calibrateintercept+vo)/(R*responsivity)) --final conversion intercept from Vadc to Power
pmax = math.floor(1000*(slope*(vmax-vo)/(R*responsivity)+intercept)+.5) --rounded max power (uW) value as a function of R. 
pmaxstr = "max="..pmax.."uW"
pstep = math.floor(pslope+.5)--rounded plus minus for a single change in Vadc

pstepstr = "step="..pstep.."uW"

--IP addresses
IPstr1 = "IP1:unknown"
IPstr2 = "IP2:unknown"

