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
  end


end
