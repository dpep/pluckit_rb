require 'minitest/autorun'
require 'set'

$LOAD_PATH.unshift 'lib'
require 'pluckit'


class PluckItTest < Minitest::Test

  def test_array
    data = [ 1, 2, 3 ]

    assert_equal(
      1,
      PluckIt.pluck(data, 0)
    )

    assert_equal(
      2,
      PluckIt.pluck(data, 1)
    )

    assert_equal(
      3,
      PluckIt.pluck(data, :last)
    )

    assert_equal(
      3,
      PluckIt.pluck(data, :count)
    )

    assert_equal(
      [ 1, 2 ],
      PluckIt.pluck(data, 0..1)
    )

    assert_equal(
      [ 'a', 'ba', 'ca' ],
      PluckIt.pluck(
        [ 'a', 'ba', 'bb', 'bc', 'ca' ],
        /a/
      )
    )

    assert_equal(
      [ 1, 2 ],
      PluckIt.pluck(data, 0, 1)
    )
  end


  def test_hash
    data = {
      a: 1,
      b: 2,
      c: 3,
    }

    assert_equal(
      2,
      PluckIt.pluck(data, :b)
    )

    assert_nil(
      PluckIt.pluck(data, :z)
    )

    assert_nil(
      PluckIt.pluck(data, :count)
    )

    assert_equal(
      [ 1, 2 ],
      PluckIt.pluck(data, :a, :b)
    )
  end


  class ABC
    def foo() 123 end
    def bar() 456 end
  end

  def test_obj
    assert_equal(
      123,
      PluckIt.pluck(ABC.new, :foo)
    )

    assert_equal(
      self.class.const_get(:ABC),
      PluckIt.pluck(ABC.new, :class)
    )

    assert_equal(
      [ 123, 456 ],
      PluckIt.pluck(ABC.new, :foo, :bar)
    )
  end


  def test_set
    data = Set.new [ 1, 2, 3 ]

    assert_equal(
      1,
      PluckIt.pluck(data, :first)
    )

    assert_equal(
      3,
      PluckIt.pluck(data, :count)
    )

    assert_equal(
      [ 1, 3 ],
      PluckIt.pluck(data, :first, :count)
    )
  end


end
