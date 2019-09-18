vehicles = [
  'car', 'CAR', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(vehicle_list)
  vehicle_hash = {}

  vehicle_list.each do |vehicle|
    vehicle.downcase!
    if !vehicle_hash.key?(vehicle)
      vehicle_hash[vehicle] = 1
    else
      vehicle_hash[vehicle] += 1
    end
  end
  vehicle_hash.each { |k, v| puts k + " => " + v.to_s}
end


count_occurrences(vehicles)

