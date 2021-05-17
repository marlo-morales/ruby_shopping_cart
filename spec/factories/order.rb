FactoryBot.define do
  factory :order, class: OpenStruct do
    product { build_stubbed(:product, :red_scarf) }
    quantity { 2 }
  end
end
