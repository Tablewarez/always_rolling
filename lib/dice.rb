require 'active_support/all'
require 'expression_parser'

class Dice
  InvalidModifier = Class.new(StandardError)

  class << self
    def roll(str)
      new(str).result
    end
  end

  attr_reader :raw_expression, :rolls, :result, :calculator

  def initialize(str)
    @raw_expression = str
    @rolls = []

    @result = Integer(ExpressionParser::Parser.new.parse(parse))
  end

  private

    def dice_groups(str)
      str.scan(/\d{,3}d\d{,3}[^(\ |\+)]+/)
    end

    def parse
      str = raw_expression.dup

      # Match groups of dices, calculate the groups and reinsert them
      dice_groups(str).each do |group|
        # Roll each dice
        dices, sides, modifier, modifier_amount = group.scan(/(\d+)d(\d+)(\D*)(\d*)/).flatten
        results = Integer(dices).times.collect { rand(Integer(sides)) + 1 }.sort

        # If a modifier is present, handle that
        if modifier.present?
          modifier_amount = Integer(modifier_amount.presence || 1)

          case modifier
          when 'dl' # Drop lowest N
            modifier_amount.times { results.shift }
          when 'dh' # Drop highest N
            modifier_amount.times { results.pop }
          when 'l' # Pick lowest
            results = [results.first]
          when 'h' # Pick highest
            results = [results.last]
          else
            raise InvalidModifier, "#{modifier} isn't a valid modifier for #{group}"
          end
        end

        # Sum dice results and reinsert the results in the original string
        result = results.inject(0) { |sum, x| sum + x }
        @rolls << result
        str.gsub!(group, result.to_s)
      end

      str
    end
end
