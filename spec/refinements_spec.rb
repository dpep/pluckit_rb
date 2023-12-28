describe PluckIt, :before_patch do
  it { expect([].respond_to?(:pluck)).to be false }

  context "when refined" do
    using PluckIt

    it { expect([].respond_to?(:pluck)).to be true }
    it { expect({}.respond_to?(:pluck)).to be true }
    it { expect(Set.new.respond_to?(:pluck)).to be true }

    it { expect([ 1, 2, 3 ].pluck(:to_s)).to eq([ "1", "2", "3" ]) }
    it { expect({ a: [ 1 ] }.pluck(:first)).to eq({ a: 1 }) }
    it { expect(Set.new([ 1 ]).pluck(:itself)).to eq(Set.new([ 1 ])) }
  end
end
