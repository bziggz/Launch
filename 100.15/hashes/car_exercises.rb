# FIRST CAR

car = {:type => "sedan", :color => "blue", :mileage => 80_000 }

car = {type: "sedan", color: "blue", mileage: 80_000}

#ADD YEAR 

car[:year] = 2003 

#BAD ODOMETER

car.delete(:mileage) 

puts car[:color]

# MULTIPLE CARS

vehicles = {
  car: {
    type: "sedan", 
    color: "blue", 
    year: 2003
  },
  truck: {
    type: "pickup",
    color: "red"
    year: 1998
  }
}


# WHICH COLLECTION

car_array = [[:type,  "sedan"], [:color, "blue"], [:year, 2003]]



