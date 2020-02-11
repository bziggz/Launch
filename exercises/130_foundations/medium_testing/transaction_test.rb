require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'transaction'

class TransactionTest < MiniTest::Test 
  def test_prompt_for_payment
    transaction = Transaction.new(60)
    input = StringIO.new('60\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(60, transaction.amount_paid)
  end
end