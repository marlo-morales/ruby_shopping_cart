# frozen_string_literal: true

require_relative 'promotion_handler'

class Checkout
  attr_accessor :promotional_rules, :orders

  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @orders = []
  end

  def scan(order)
    rules_for_an_order.each do |promotional_rule|
      rule = rule_klass(promotional_rule)
      @orders << rule.compute(order)
    end
  end

  def total
    sum = 0
    rules_for_all_orders.each do |promotional_rule|
      rule = rule_klass(promotional_rule)
      sum = rule.compute(@orders)
    end
    sum
  end

  private

  def rules_for_an_order
    @promotional_rules.reject do |promotional_rule|
      promotional_rule.for_all_orders
    end
  end

  def rules_for_all_orders
    @promotional_rules.select do |promotional_rule|
      promotional_rule.for_all_orders
    end
  end

  def rule_klass(promotional_rule)
    rule_type = promotional_rule.type
    var_name = "@#{rule_type}"
    return instance_variable_get(var_name) if instance_variable_defined?(var_name)

    rule = PromotionHandler.for(rule_type, promotional_rule.rule_details)
    instance_variable_set(var_name, rule)
    rule
  end
end
