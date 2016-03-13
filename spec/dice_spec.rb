require 'spec_helper'
require 'dice'

RSpec.describe Dice do
  let(:dice) { Dice.new(str) }
  let(:str) { '3d10dl +2d6dh - 5+ 1d100 +6' }

  describe '#raw_expression' do
    subject { dice.raw_expression }
    it { is_expected.to eql(str) }
  end
end
