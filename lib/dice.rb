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
    @modified_rolls = []

    ExpressionParser::Parser.new.parse parse
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
        dices, sides, modifier = group.scan(/\d+|\D+$/)
        results = Integer(dices).times.collect { rand(Integer(sides)) + 1 }.sort

        # If a modifier is present, handle that
        if modifier.present?
          case modifier
          when 'dl' then results.shift # Drop lowest
          when 'dh' then results.pop # Drop highest
          else raise InvalidModifier, "#{modifier} isn't a valid modifier for #{group}"
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
