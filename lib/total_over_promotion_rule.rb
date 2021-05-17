# frozen_string_literal: true

require_relative 'promotion_rule'

class TotalOverPromotionRule < PromotionRule
  def compute(orders)
    total = orders&.sum do |order|
              (order&.amount || order.product.price) * order.quantity
            end || 0
    return total unless eligible?(total)

    total - discount(total)
  end

  def eligible?(total)
    total > @rule_details.total_max_price.to_i
  end

  private

  def discount(total)
    total * (@rule_details.total_percent_discount.to_f / 100.0)
  end
end
