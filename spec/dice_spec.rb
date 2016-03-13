require 'spec_helper'
require 'dice'

RSpec.describe Dice do
  let(:dice) { Dice.new(str) }
  let(:str) { '3d6dl2 + 3d6dh2 + 3d6dl + 3d6dh + 3d6l + 3d6h + 2'}
  subject { dice.result }

  it { is_expected.to be_a Integer }
  it { is_expected.to be <= 50 } # Max value of expression

  it 'can handle 5000 roll per second' do
    time = Benchmark.realtime { 10_000.times { Dice.roll(str) } }
    expect(time).to be < 2.seconds
  end

  describe '#raw_expression' do
    subject { dice.raw_expression }
    it { is_expected.to eql(str) }
  end
end
