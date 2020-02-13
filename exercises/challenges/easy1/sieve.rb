class Sieve
  attr_accessor :range
  attr_reader :max_num

  def initialize(upper_limit)
    @range = (2..upper_limit).to_a.product([true]).to_h
    @max_num = upper_limit
  end

  def primes
    counter = 2

    while counter <= max_num
      multiplier = counter
      while counter * multiplier <= max_num
        range[counter * multiplier] = false
        multiplier += 1
      end
      counter += 1
    end

    range.select { |_, v| v == true }.keys
  end
end
