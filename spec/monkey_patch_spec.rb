describe PluckIt, :skip_patch do
  it "did not monkey patch" do
    expect(Array.method_defined?(:pluck)).to be false
    expect([]).not_to respond_to(:pluck)
  end
end
