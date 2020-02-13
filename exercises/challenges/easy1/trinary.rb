class Trinary
  def initialize(str)
    @base_3 = str
  end

  def to_decimal
    return 0 unless valid_str?
    num_arr = @base_3.split('').map(&:to_i)
    total = 0
    num_arr.reverse.each_with_index do |num, idx|
      total += num * (3**idx)
    end

    total
  end

  def valid_str?
    @base_3 =~ /\A\d*[^3-9]\z/ 
  end
end