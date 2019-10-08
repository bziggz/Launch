arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |arr|
            arr.select do |value|
              value % 2 != 0
            end
          end

p new_arr