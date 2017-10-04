require 'minitest/autorun'
require 'pluckit'


class PluckItArrayTest < Minitest::Test


  def test_basic
    data = [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ],
    ]

    assert_equal(
      [ 1, 4, 7 ],
      data.pluck(0)
    )
  end


  def test_empty
    assert_equal(
      [],
      [].pluck(nil)
    )

    assert_equal(
      [],
      [].pluck(0)
    )
  end


  def test_hashes
    data = [
      { k: 1, v: 2 },
      { k: 2, v: 4 },
      { k: 3, v: 6 },
    ]

    assert_equal(
      [ 1, 2, 3 ],
      data.pluck(:k)
    )

    assert_equal(
      [ 2, 4, 6 ],
      data.pluck(:v)
    )
  end


  def test_missing
    assert_equal(
      [ nil, 2 ],
      [{ a: 1 }, { k: 2 }].pluck(:k)
    )
  end


end
