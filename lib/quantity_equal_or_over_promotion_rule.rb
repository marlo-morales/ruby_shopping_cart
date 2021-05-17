# frozen_string_literal: true

require_relative 'promotion_rule'

class QuantityEqualOrOverPromotionRule < PromotionRule
  def compute(order)
    os_order =
      if order.is_a?(OpenStruct)
        order
      else
        OpenStruct.new(order || {})
      end
    os_order.amount = @rule_details.quantity_fixed_price if eligible?(os_order)
    os_order
  end

  def eligible?(order)
    same_product?(order) && order.quantity.to_i >= @rule_details.quantity_max.to_i
  end

  private

  def same_product?(order)
    order.product.code == @rule_details.quantity_product_code
  end
end
