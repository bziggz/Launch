require "time"
require "date"

DAY_HASH = {
  0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 
  4 => "Thursday", 5 => "Friday", 6 => "Saturday" 
}

SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
MINUTES_PER_WEEK = MINUTES_PER_DAY * 7
BASE_TIME = Time.new(2019, 10, 13, 0, 0, 0)

def time_of_day(int)
  int %= MINUTES_PER_DAY

  minutes = format("%02d", int % MINUTES_PER_HOUR)
  hours = format("%02d", int / MINUTES_PER_HOUR)

  "#{hours}:#{minutes}"
end

def date_and_time_of_day(int)
  int %= MINUTES_PER_WEEK
  day_num = int / MINUTES_PER_DAY

  day = DAY_HASH[day_num.abs]

  "#{day} #{time_of_day(int)}"
end

def method_time_of_day(int)
  seconds = int * SECONDS_PER_MINUTE

  time = BASE_TIME + seconds

  time_string = time.strftime("%A %H:%M")
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

puts "\n"

p date_and_time_of_day(0) 
p date_and_time_of_day(-3) 
p date_and_time_of_day(35) 
p date_and_time_of_day(-1437) 
p date_and_time_of_day(3000) 
p date_and_time_of_day(800) 
p date_and_time_of_day(-4231) 

puts "\n"

p method_time_of_day(0) #== "00:00"
p method_time_of_day(-3) #== "23:57"
p method_time_of_day(35) #== "00:35"
p method_time_of_day(-1437) #== "00:03"
p method_time_of_day(3000) #== "02:00"
p method_time_of_day(800) #== "13:20"
p method_time_of_day(-4231) #== "01:29"