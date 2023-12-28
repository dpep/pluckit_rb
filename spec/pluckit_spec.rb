describe "PluckIt.pluckit" do
  context "when plucking an array" do
    let(:data) { [ 1, 2, 3 ] }

    it "can pluck an index" do
      expect(PluckIt.pluckit(data, 0)).to eq 1
      expect(PluckIt.pluckit(data, 1)).to eq 2
    end

    it "can pluck via methods" do
      expect(PluckIt.pluckit(data, :last)).to eq 3
      expect(PluckIt.pluckit(data, :sum)).to eq 6
    end

    it "can pluck multiple values" do
      expect(PluckIt.pluckit(data, 0, 1)).to eq [ 1, 2 ]
    end

    it "can pluck ranges" do
      expect(PluckIt.pluckit(data, 0..1)).to eq [ 1, 2 ]
    end

    context "when plucking with a regex" do
      let(:data) { [ "a", "ba", "bb", "bc", "ca" ] }

      it { expect(PluckIt.pluckit(data, /a/)).to eq [ "a", "ba", "ca" ] }
    end

    it "returns nil for bogus a index" do
      expect(PluckIt.pluckit(data, 99)).to be nil
    end
  end

  context "when plucking a hash" do
    let(:data) do
      { a: 1, b: 2, c: 3 }
    end

    it "can pluck a key" do
      expect(PluckIt.pluckit(data, :a)).to eq 1
      expect(PluckIt.pluckit(data, :c)).to eq 3
    end

    # it "can pluck via methods" do
    #   expect(PluckIt.pluckit(data, :count)).to eq 3
    # end

    it "can pluck multiple values" do
      expect(PluckIt.pluckit(data, :a, :b)).to eq [ 1, 2 ]
    end

    it "returns nil for bogus a key" do
      expect(PluckIt.pluckit(data, :z)).to be nil
    end
  end

  context "when plucking a set" do
    let(:data) { Set.new [ 1, 2, 3 ] }

    it "can pluck a method" do
      expect(PluckIt.pluckit(data, :first)).to eq 1
      expect(PluckIt.pluckit(data, :count)).to eq 3
    end

    it "can pluck multiple values" do
      expect(PluckIt.pluckit(data, :first, :count)).to eq [ 1, 3 ]
    end
  end

  context "when plucking an object" do
    it "can pluck a method" do
      expect(PluckIt.pluckit(ABC.new, :ott)).to eq 123
    end

    it "can pluck a class method" do
      expect(PluckIt.pluckit(ABC.new, :class)).to eq ABC
    end

    it "can pluck multiple methods" do
      expect(PluckIt.pluckit(ABC.new, :ott, :class)).to eq [ 123, ABC ]
    end
  end

  it "catches bogus plucks" do
    expect {
      PluckIt.pluckit(ABC.new, :bogus)
    }.to raise_error(ArgumentError, /invalid handle/)
  end
end
