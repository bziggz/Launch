class MiniError < StandardError; end
class EmptyStackError < MiniError; end
class InvalidTokenError < MiniError; end

class Minilang
  attr_accessor :stack, :register
  VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(command_string)
    @command_list = command_string.split(' ')
  end

  def eval(*arg)
    @stack = []
    @register = 0
    @command_list.each do |token| 
      self.execute(token, *arg)
    end
  rescue MiniError => e
    puts e.message 
  end

  def execute(token, *arg)
    if VALID_TOKENS.include?(token)
      send(token.downcase)
    elsif token =~/\A[+-]?\d+\z/
      @register = token.to_i
    else
      raise InvalidTokenError, "Invalid token: #{token}"
    end
  end

  def push
    @stack << @register.clone
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def pop
    raise EmptyStackError, "Empty Stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print
    puts @register
  end
end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT tokens)