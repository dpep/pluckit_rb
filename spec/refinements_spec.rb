describe PluckIt, :before_patch do
  using PluckIt

  it { expect([].respond_to?(:pluck)).to be true }
  it { expect({}.respond_to?(:pluck)).to be true }
  it { expect(Set.new.respond_to?(:pluck)).to be true }

  it { expect([ 1, 2, 3 ].pluck(:to_s)).to eq([ "1", "2", "3" ]) }
end
