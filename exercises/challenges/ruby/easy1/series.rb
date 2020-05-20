class Series
  def initialize(string)
    @series = string
  end

  def slices(n)
    raise ArgumentError if n > @series.size
    arr = @series.each_char.map(&:to_i).each_cons(n).to_a
  end
end