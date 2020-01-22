class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def current_switch_state
    puts "The switch is #{switch}."
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

bob = Machine.new
bob.start
bob.current_switch_state
bob.stop
bob.current_switch_state