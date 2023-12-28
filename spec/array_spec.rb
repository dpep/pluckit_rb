describe "Array.pluck" do
  let(:data) do
    [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ],
    ]
  end

  it "can pluck values from an array of arrays" do
    res = data.pluck(0)
    expect(res).to eq([ 1, 4, 7 ])
  end

  it "can pluck :last" do
    res = data.pluck(:last)
    expect(res).to eq([ 3, 6, 9 ])
  end

  it "can pluck multiple values" do
    res = data.pluck(0, 1)
    expect(res).to eq([
      [ 1, 2 ],
      [ 4, 5 ],
      [ 7, 8 ],
    ])
  end

  context "when plucking from an empty array" do
    subject { [].pluck(0) }

    it { is_expected.to be_empty }
    it { is_expected.to eq([]) }
  end

  it "returns nil for a missing index" do
    res = data.pluck(99)
    expect(res).to eq([ nil, nil, nil ])
  end

  context "when plucking from an array of hashes" do
    let(:data) do
      [
        { k: 1, v: 2 },
        { k: 2, v: 4 },
        { k: 3, v: 6 },
      ]
    end

    it "can pluck :k" do
      res = data.pluck(:k)
      expect(res).to eq([ 1, 2, 3 ])
    end

    it "can pluck :v" do
      res = data.pluck(:v)
      expect(res).to eq([ 2, 4, 6 ])
    end

    context "when plucking a missing key" do
      let(:data) do
        [
          { a: 1 },
          { k: 2 },
        ]
      end

      it "returns nil for missing key" do
        res = data.pluck(:k)
        expect(res).to eq([ nil, 2 ])
      end
    end
  end

  context "when plucking from an object" do
    let(:data) do
      [
        ABC.new(1),
        ABC.new(2),
        ABC.new(3),
      ]
    end

    it "can be plucked" do
      res = data.pluck(:val)
      expect(res).to eq([ 1, 2, 3 ])
    end
  end

  context "when plucking from an Array subclass" do
    subject { data.pluck(:itself) }

    class MyArray < Array; end

    let(:data) { MyArray.new [ 1, 2, 3 ] }

    it { is_expected.to eq([ 1, 2, 3 ]) }

    it "preserves the class" do
      is_expected.to be_a MyArray
    end
  end
end
