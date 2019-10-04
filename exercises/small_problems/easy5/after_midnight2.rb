require "time"

SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
SECONDS_PER_DAY = MINUTES_PER_DAY * SECONDS_PER_MINUTE
BASE_TIME = Time.new(2019, 10, 13, 0, 0, 0)

def string_split(str)
  arr = str.delete(":").split("")

  arr.map! { |digit| digit.to_i }

  return 0 if arr.sum == 0

  hour_minutes = (arr[0] * 10 + arr[1]) * MINUTES_PER_HOUR
  minutes = arr[-2] * 10 + arr[-1]

  hour_minutes + minutes
end

def after_midnight(str)
  delta_minutes = string_split(str)
  delta_minutes % MINUTES_PER_DAY
end

def before_midnight(str)
  delta_minutes = string_split(str)
  return 0 if delta_minutes == 0
  MINUTES_PER_DAY % delta_minutes
end

def method_after_midnight(str)
  new_time = Time.new(2019, 10, 13, str[0, 2].to_i, str[-2, 2].to_i)
  time_delta = (BASE_TIME - new_time).abs
  (time_delta / SECONDS_PER_MINUTE % MINUTES_PER_DAY).to_i
end

def method_before_midnight(str)
  new_time = Time.new(2019, 10, 13, str[0, 2].to_i, str[-2, 2].to_i)
  time_delta = BASE_TIME - new_time + SECONDS_PER_DAY
  (time_delta / SECONDS_PER_MINUTE % MINUTES_PER_DAY).to_i
end

p after_midnight('00:00') #== 0
p before_midnight('00:00') #== 0
p after_midnight('12:34') #== 754
p before_midnight('12:34') #== 686
p after_midnight('24:00') #== 0
p before_midnight('24:00') #== 0

puts "\n"

p method_after_midnight('00:00') #== 0
p method_before_midnight('00:00') #== 0
p method_after_midnight('12:34') #== 754
p method_before_midnight('12:34') #== 686
p method_after_midnight('24:00') #== 0
p method_before_midnight('24:00') #== 0