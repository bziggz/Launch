actors = { :archer=>"H Jon Benjamin", 
          :schitts_creek=>"Daniel Levy", 
          :detour=>"Jason Jones", 
          :john_wick=>"Keanu Reeves", 
          :big_lebowski=>"Jeff Bridges", 
          :captain_marvel=>"Brie Larson"
        }

actors.each_key { |k| puts k }

puts "\n"

actors.each_value { |v| puts v }

puts "\n"

actors.each { |k, v| puts "#{v} was in #{k}." }