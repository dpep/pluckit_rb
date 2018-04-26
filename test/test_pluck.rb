require 'minitest/autorun'
require 'set'

require 'pluckit'


class PluckItTest < Minitest::Test

  def test_array
    data = [ 1, 2, 3 ]

    assert_equal(
      1,
      PluckIt.pluckit(data, 0)
    )

    assert_equal(
      2,
      PluckIt.pluckit(data, 1)
    )

    assert_equal(
      3,
      PluckIt.pluckit(data, :last)
    )

    assert_equal(
      3,
      PluckIt.pluckit(data, :count)
    )

    assert_equal(
      [ 1, 2 ],
      PluckIt.pluckit(data, 0..1)
    )

    assert_equal(
      [ 'a', 'ba', 'ca' ],
      PluckIt.pluckit(
        [ 'a', 'ba', 'bb', 'bc', 'ca' ],
        /a/
      )
    )

    assert_equal(
      [ 1, 2 ],
      PluckIt.pluckit(data, 0, 1)
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
      PluckIt.pluckit(data, :b)
    )

    assert_nil(
      PluckIt.pluckit(data, :z)
    )

    assert_nil(
      PluckIt.pluckit(data, :count)
    )

    assert_equal(
      [ 1, 2 ],
      PluckIt.pluckit(data, :a, :b)
    )
  end


  class ABC
    def foo() 123 end
    def bar() 456 end
  end

  def test_obj
    assert_equal(
      123,
      PluckIt.pluckit(ABC.new, :foo)
    )

    assert_equal(
      self.class.const_get(:ABC),
      PluckIt.pluckit(ABC.new, :class)
    )

    assert_equal(
      [ 123, 456 ],
      PluckIt.pluckit(ABC.new, :foo, :bar)
    )
  end


  def test_set
    data = Set.new [ 1, 2, 3 ]

    assert_equal(
      1,
      PluckIt.pluckit(data, :first)
    )

    assert_equal(
      3,
      PluckIt.pluckit(data, :count)
    )

    assert_equal(
      [ 1, 3 ],
      PluckIt.pluckit(data, :first, :count)
    )
  end


end
