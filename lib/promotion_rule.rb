# frozen_string_literal: true

require 'ostruct'

class PromotionRule
  attr_accessor :rule_details

  def initialize(promotional_rule_details)
    promotional_rule_details ||= {}
    @rule_details = OpenStruct.new(promotional_rule_details)
  end

  def eligible?
    not_implemented_error!
  end

  def compute(param)
    not_implemented_error!
  end

  private

  def not_implemented_error!
    raise NotImplementedError, "Method '#{caller[0][/`(.*)'/, 1]}' must be implemented."
  end
end
