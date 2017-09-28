function update_voltage()
voltageadc = adc.read(0)
-- vadjust = (1000/1024)*2.98 1000/1024 changes readout to base 10, 2.98 is from the internal voltage divider.

--calibrateslope is slope from calibrating voltage in device, calibrate intercept is the initial voltage
-- which is noise
voltage =(calibrateslope*voltageadc*vadjust-calibrateintercept)
vstr = "V="..voltage.."mV"
update_power(voltageadc)
tmr.start(tmr_voltage)
end

-- set up timer for voltage update
tmr.register(tmr_voltage, voltage_update_interval, tmr.ALARM_SEMI, function() update_voltage() end)

print("--- Starting Power Updates ---")
tmr.start(tmr_voltage)