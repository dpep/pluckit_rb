require 'minitest/autorun'
require 'pluckit'


class PluckItHashTest < Minitest::Test


  def test_basic
    assert_equal(
      {
        a: 1,
        b: 4,
        c: 7,
      },
      {
        a: [ 1, 2, 3 ],
        b: [ 4, 5, 6 ],
        c: [ 7, 8, 9 ],
      }.pluck(0)
    )

    assert_equal(
      {
        a: 1,
        b: 2,
        c: 3,
      },
      {
        a: { x: 1, y: 2 },
        b: { x: 2, y: 4 },
        c: { x: 3, y: 6 },
      }.pluck(:x)
    )
  end


  class ABC
    attr_accessor :val
    def initialize(v) self.val = v end
  end

  def test_obj
    assert_equal(
      {
        a: 1,
        b: 2,
        c: 3,
      },
      {
        a: ABC.new(1),
        b: ABC.new(2),
        c: ABC.new(3),
      }.pluck(:val)
    )
  end


end
