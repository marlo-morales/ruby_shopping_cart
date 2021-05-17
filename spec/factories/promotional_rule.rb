FactoryBot.define do
  factory :promotional_rule, class: OpenStruct do
    trait :quantity_equal_or_over do
      type { 'quantity_equal_or_over' }
      for_all_orders { false }
      rule_details { { quantity_product_code: '001', quantity_max: 2, quantity_fixed_price: 8.5 } }
    end

    trait :total_over do
      type { 'total_over' }
      for_all_orders { true }
      rule_details { { total_max_price: 60, total_percent_discount: 10 } }
    end
  end
end
