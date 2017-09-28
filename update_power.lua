function update_power(voltageadc)
-- vo is initial voltage from power calibration. R is resistor value used in the power meter
--responsivity is calculated responsivity from the photodiode
power = math.floor(pslope*voltageadc + pint + .5)
-- pint total intercept from all calibrated slope and intercept values
-- pslope total relationship between power and Vadc from all calibrated slope and intercept values
pstr = "P="..power.."uW"
power_buzz(power)
end
