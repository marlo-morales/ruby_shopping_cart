describe TotalOverPromotionRule do
  subject { described_class.new(rule_details) }

  let(:promotional_rule) { build_stubbed(:promotional_rule, :total_over) }
  let(:rule_details) { promotional_rule.rule_details }
  let(:product) { build_stubbed(:product, :silk_dress) }
  let(:order1) { build_stubbed(:order, quantity: 3) }
  let(:order2) { build_stubbed(:order, product: product, quantity: 2) }
  let(:orders) { [order1, order2] }
  let(:sum) { orders.sum { |order| order.product.price * order.quantity } }

  describe '#compute' do
    it 'computes the total amount of orders' do
      total = sum - (sum * (rule_details[:total_percent_discount].to_f / 100.0))
      expect(subject.compute(orders)).to eq total
    end

    context 'when ineligible' do
      let(:order1) { build_stubbed(:order, product: product, quantity: 1) }

      it 'returns the total amount of orders' do
        expect(subject.compute(orders)).to eq sum
      end
    end
  end

  describe '#eligible?' do
    it 'returns truthy' do
      expect(subject.eligible?(sum)).to be_truthy
    end

    context 'when ineligible' do
      let(:order1) { build_stubbed(:order, product: product, quantity: 1) }

      it 'returns falsy' do
        expect(subject.eligible?(sum)).to be_falsy
      end
    end
  end
end
