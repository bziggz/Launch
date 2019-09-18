

# def calc_product(int)
#   total = 1
#   (1..int).map { |x| total *= x }
# end

puts "Please enter an integer greater than 0:"
int = gets.chomp.to_i

puts "Enter 's' to compute the sum, or 'p' to compute the product:"
operator = gets.chomp.downcase

total = case operator
        when "s"
          (1..int).sum
        when "p"
          (1..int).inject(1, :*)
        end

puts total

