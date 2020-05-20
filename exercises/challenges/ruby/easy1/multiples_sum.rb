class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def to(target)
    self.class.to(target, @nums)
  end

  def self.to(target, nums = [3, 5])
    output = []

    nums.each do |num|
      multiplier = 1
      until num * multiplier >= target
        output << (num * multiplier)
        multiplier += 1
      end
    end

    output.uniq.sum
  end
end

