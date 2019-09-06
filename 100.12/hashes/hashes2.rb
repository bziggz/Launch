tv_leads = { archer: "H Jon Benjamin", schitts_creek: "Daniel Levy", detour: "Jason Jones" }
movie_leads = { john_wick: "Keanu Reeves", big_lebowski: "Jeff Bridges", captain_marvel: "Brie Larson"}

actors = tv_leads.merge(movie_leads)

p actors

#############

leads = tv_leads

leads.merge!(movie_leads)

puts "\n"

p leads