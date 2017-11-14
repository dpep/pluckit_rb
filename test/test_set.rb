require 'minitest/autorun'
require 'pluckit'


class PluckItSetTest < Minitest::Test


  def test_basic
    data = Set.new [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ],
    ]

    assert_equal(
      Set.new([ 1, 4, 7 ]),
      data.pluck(0)
    )

    assert_equal(
      Set.new([ 3, 6, 9 ]),
      data.pluck(:last)
    )

    assert_equal(
      Set.new([
        [ 1, 3 ],
        [ 4, 6 ],
        [ 7, 9 ],
      ]),
      data.pluck(:first, :max)
    )
  end


  class MySet < Set; end
  def test_clone
    data = MySet.new [ 1, 2, 3 ]

    assert_equal(
      Set.new([ 1, 2, 3 ]),
      data.pluck(:itself)
    )

    assert_equal(
      self.class.const_get(:MySet),
      data.pluck(:itself).class
    )
  end


end
