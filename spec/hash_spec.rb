describe "Hash.pluck" do
  context "when plucking from a hash of arrays" do
    let(:data) do
      {
        a: [ 1, 2, 3 ],
        b: [ 4, 5, 6 ],
        c: [ 7, 8, 9 ],
      }
    end

    it "can pluck" do
      res = data.pluck(0)
      expect(res).to eq({ a: 1, b: 4, c: 7 })
    end

    it "can pluck multiple values" do
      res = data.pluck(0, :last)
      expect(res).to eq({
        a: [ 1, 3 ],
        b: [ 4, 6 ],
        c: [ 7, 9 ],
      })
    end
  end

  context "when plucking from a hash of hashes" do
    let(:data) do
      {
        a: { x: 1, y: 2 },
        b: { x: 2, y: 4 },
        c: { x: 3, y: 6 },
      }
    end

    it "can pluck" do
      res = data.pluck(:x)
      expect(res).to eq({ a: 1, b: 2, c: 3 })
    end

    it "can pluck multiple values" do
      res = data.pluck(:x, :y)
      expect(res).to eq({
        a: [ 1, 2 ],
        b: [ 2, 4 ],
        c: [ 3, 6 ],
      })
    end
  end

  context "when plucking from a hash of object" do
    let(:data) do
      {
        a: ABC.new(1),
        b: ABC.new(2),
        c: ABC.new(3),
      }
    end

    it "can pluck" do
      res = data.pluck(:val)
      expect(res).to eq({ a: 1, b: 2, c: 3 })
    end
  end

  context "when plucking from a Hash subclass" do
    subject(:res) { data.pluck(:itself) }

    class MyHash < Hash; end

    let(:data) do
      MyHash.new("abc").update(a: 1)
    end

    it { is_expected.to eq({ a: 1 }) }

    it "preserves the class" do
      is_expected.to be_a MyHash
    end

    it "preserves the default value" do
      expect(res[:missing]).to eq "abc"
    end
  end
end
