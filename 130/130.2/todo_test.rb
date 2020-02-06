require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todo'

class ToDoTest < Minitest::Test 

  def setup
    @todo1 = Todo.new('Buy Milk')
    @todo2 = Todo.new("Clean Room")
    @todo3 = Todo.new("Go to Gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_exception
    assert_raises(TypeError) { @list.add("Hello") }
  end

  def test_shovel
    @list << Todo.new("Test todo")
    assert_equal(4, @list.size)
  end

  def test_add_alias
    @todo4 = Todo.new("Test Todo 2")
    assert_equal(@list.add(@todo4), @list << @todo4)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(3, @list.select(&:done?).size)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @list.mark_all_undone
    assert_equal(3, @list.select(&:undone?).size)
  end

  def test_all_done
    @todo1.done!
    assert_equal(1, @list.select(&:done?).size)
  end

  def test_all_not_done
    @todo1.done!
    assert_equal(2, @list.select(&:undone?).size)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy Milk"))
  end

  def test_mark_done
    @list.mark_done("Buy Milk")
    assert_equal(1, @list.select(&:done?).size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_done!
    @list.done!
    assert(@list.done?)
  end

  def test_remove_at
    assert_equal(@todo2, @list.remove_at(1))
    assert_raises(IndexError) { @list.remove_at(100) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [ ] Buy Milk
    [ ] Clean Room
    [ ] Go to Gym
    OUTPUT
 
    assert_equal(output, @list.to_s)
  end

  def test_done_to_s
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [ ] Buy Milk
    [X] Clean Room
    [ ] Go to Gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_all_done_to_s
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [X] Buy Milk
    [X] Clean Room
    [X] Go to Gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal(@todos, result)
  end

  def test_each_return
    assert_same(@list, @list.each(&:to_s))
  end

  def test_select
    @list.mark_all_done
    refute_equal(@list, @list.select(&:done?))
  end
end
