def swap(str)
  string_array = str.split

  string_array.map! do |str|
    str_arr = str.split("")
    str_arr.unshift(str_arr.pop).push(str_arr[1]).delete_at(1).join
  end

  string_array.join(" ")
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'