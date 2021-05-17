FactoryBot.define do
  factory :product, class: OpenStruct do
    trait :red_scarf do
      code { '001' }
      name { 'Red Scarf' }
      price { 9.25 }
    end

    trait :silver_cufflinks do
      code { '002' }
      name { 'Silver cufflinks' }
      price { 45.0 }
    end

    trait :silk_dress do
      code { '003' }
      name { 'Silk Dress' }
      price { 19.95 }
    end
  end
end
