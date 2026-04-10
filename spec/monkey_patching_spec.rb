describe 'pluckit/pluck', :before_patch do
  it 'loads PluckIt without monkey patching core classes' do
    expect(defined?(PluckIt)).to be_truthy
    expect { [1, 2, 3].pluck(0) }.to raise_error(NoMethodError)
    expect { { a: 1 }.pluck(0) }.to raise_error(NoMethodError)
    expect { Set.new([1, 2, 3]).pluck(0) }.to raise_error(NoMethodError)
  end
end
