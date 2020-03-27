require 'minitest/autorun'
require 'set'

require 'pluckit/pluck'


# basic sanity check, since other tests will
# probe much more extensively

class PluckTest < Minitest::Test

  def test_basic
    data = [
      { k: 'a', v: 1 },
      { k: 'b', v: 2 },
      { k: 'c', v: 3 },
    ]
    assert_equal(
      [ 'a', 'b', 'c' ],
      PluckIt.pluck(data, :k)
    )


    temp = {
      june: [ 78, 82, 80 ],
      july: [ 80, 83, 86 ],
      august: [ 80, 76, 79 ],
    }
    assert_equal(
      {
        june: 82,
        july: 86,
        august: 80,
      },
      PluckIt.pluck(temp, :max)
    )


    people = Set.new([
      {name: 'dpepper', age: 31},
      {name: 'josh', age: 30},
    ])
    assert_equal(
      Set.new(['dpepper', 'josh']),
      PluckIt.pluck(people, :name)
    )
  end


end
