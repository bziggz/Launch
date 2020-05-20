class Octal
  def initialize(str)
    @base_8 = str
  end

  def to_decimal
    return 0 unless valid_str?
    num_arr = @base_8.split('').map(&:to_i)
    total = 0
    num_arr.reverse.each_with_index do |num, idx|
      total += num * (8**idx)
    end

    total
  end

  def valid_str?
    @base_8 =~ /\A\d*[^8-9]\z/ 
  end
end

