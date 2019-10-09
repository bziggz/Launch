# START 
# INPUT a float representing an angle
# IF num > 360 degrees, modulo
# CONVERT number preceding decimal point to degree string
# CONVERT number following dec point to minutes and seconds
#  - 60 sec/min, 60 min/degree, 360 sec/degree
# OUTPUT degrees, minutes, seconds
# END 



DEGREE = "\xC2\xB0"
MINUTES = 60
SEC_PER_MIN = 60

def dms(flt)
  flt = flt % 360
  degrees = flt.floor
  mins_and_secs = (flt - degrees) * MINUTES
  minutes = mins_and_secs.floor
  seconds = ((mins_and_secs - minutes) * SEC_PER_MIN).round

  if seconds == 60 
    minutes += 1
    seconds = 0
  end

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

puts "\n"

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")