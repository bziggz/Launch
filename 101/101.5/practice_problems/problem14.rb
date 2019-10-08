hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

expected_return = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]



arr = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |word| 
      word.capitalize
    end
  else
    value[:size].upcase
  end
end

p arr
p expected_return