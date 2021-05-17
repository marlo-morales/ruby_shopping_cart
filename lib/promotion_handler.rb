# frozen_string_literal: true

require_relative 'quantity_equal_or_over_promotion_rule'
require_relative 'total_over_promotion_rule'

class PromotionHandler
  def self.for(rule_type, rule_details)
    case rule_type.to_s
    when 'quantity_equal_or_over'
      QuantityEqualOrOverPromotionRule.new(rule_details)
    when 'total_over'
      TotalOverPromotionRule.new(rule_details)
    else
      raise "'#{rule_type}' - unsupported type of promotional rule."
    end
  end
end
