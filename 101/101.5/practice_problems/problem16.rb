
def generate_uuid
  chars = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  uuid = ""
  until uuid.size == 36
    if [8, 13, 18, 23].include?(uuid.size)
      uuid << "-"
    else
      uuid << chars.sample
    end
  end
  uuid
end

10.times { puts generate_uuid }