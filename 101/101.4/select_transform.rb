produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hsh)
  selected_items = {}
  counter = 0
  item_keys = hsh.keys

  loop do
    break if counter == item_keys.size

    if  hsh[item_keys[counter]] == 'Fruit'
      selected_items[item_keys[counter]] = hsh[item_keys[counter]]
    end

    counter += 1
  end

  selected_items
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

puts "--------------------------"

def double_numbers!(num_list)
  counter = 0

  loop do
    break if counter == num_list.size

    number = num_list[counter]
    num_list[counter] = number * 2

    counter += 1
  end

  num_list
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers

puts "--------------------------"

def double_odd_indices(num_list)
  counter = 0
  doubled_array = []

  loop do 
    break if counter == num_list.size

    number =  counter.odd? ? num_list[counter] * 2 : num_list[counter]

    doubled_array << number
    counter += 1

  end

  doubled_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)

puts "--------------------------"

def multiply(num_list, multiplier)
  counter = 0
  multiplied_numbers = []

  loop do
    break if counter == num_list.size

    multiplied_numbers << num_list[counter] * multiplier

    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]


