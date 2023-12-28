describe "PluckIt.pluck" do
  context "when plucking from arrays" do
    let(:data) do
      [
        { k: 'a', v: 1 },
        { k: 'b', v: 2 },
        { k: 'c', v: 3 },
      ]
    end

    it "plucks values" do
      res = PluckIt.pluck(data, :k)
      expect(res).to eq [ "a", "b", "c" ]
    end
  end

  context "when plucking from hashes" do
    let(:data) do
      {
        june: [ 78, 82, 80 ],
        july: [ 80, 83, 86 ],
        august: [ 80, 76, 79 ],
      }
    end

    it "plucks values" do
      res = PluckIt.pluck(data, :max)
      expect(res).to eq({
        june: 82,
        july: 86,
        august: 80,
      })
    end
  end

  context "when plucking from sets" do
    subject { PluckIt.pluck(data, :name) }

    let(:data) do
      Set.new [
        { name: 'dpepper', age: 31 },
        { name: 'josh', age: 30 },
      ]
    end

    it { is_expected.to be_a Set }
    it { is_expected.to contain_exactly("dpepper", "josh") }
  end
end
