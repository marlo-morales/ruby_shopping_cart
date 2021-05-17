describe QuantityEqualOrOverPromotionRule do
  subject { described_class.new(rule_details) }

  let(:promotional_rule) { build_stubbed(:promotional_rule, :quantity_equal_or_over) }
  let(:rule_details) { promotional_rule.rule_details }
  let(:order) { build_stubbed(:order) }

  describe '#compute' do
    it 'computes the amount of the order' do
      expect(order.product.price).not_to eq rule_details[:quantity_fixed_price]
      expect(subject.compute(order).amount).to eq rule_details[:quantity_fixed_price]
    end

    context 'when ineligible' do
      let(:order) { build_stubbed(:order, quantity: 1) }

      it 'does not compute the amount' do
        expect(order.product.price).not_to eq rule_details[:quantity_fixed_price]
        expect(subject.compute(order).amount).not_to eq rule_details[:quantity_fixed_price]
      end
    end
  end

  describe '#eligible?' do
    it 'returns truthy' do
      expect(subject.eligible?(order)).to be_truthy
    end

    context 'when ineligible' do
      let(:order) { build_stubbed(:order, quantity: 1) }

      it 'returns falsy' do
        expect(subject.eligible?(order)).to be_falsy
      end
    end
  end
end
