describe "Set.pluck" do
  let(:data) do
    Set.new [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ],
    ]
  end

  it "can pluck an index" do
    res = data.pluck(0)
    expect(res).to eq Set.new([ 1, 4, 7 ])
  end

  it "can pluck each :last" do
    res = data.pluck(:last)
    expect(res).to eq Set.new([ 3, 6, 9 ])
  end

  it "can pluck multiple values" do
    res = data.pluck(:first, :max)
    expect(res).to eq Set.new([
      [ 1, 3 ],
      [ 4, 6 ],
      [ 7, 9 ],
    ])
  end

  context "when plucking from a Set subclass" do
    subject { data.pluck(:itself) }

    class MySet < Set; end

    let(:data) do
      MySet.new [ 1, 2, 3 ]
    end

    it { is_expected.to be_a MySet }
    it { is_expected.to contain_exactly(1, 2, 3) }
  end
end
