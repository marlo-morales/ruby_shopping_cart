describe PromotionHandler do
  let(:rule_details) { promotional_rule.rule_details }

  describe '#for' do
    context 'when promotional rule type is quantity_equal_or_over' do
      let(:promotional_rule) { build_stubbed(:promotional_rule, :quantity_equal_or_over) }

      it 'returns the instance of QuantityEqualOrOverPromotionRule class' do
        expect(described_class.for(promotional_rule.type, rule_details)).to be_a QuantityEqualOrOverPromotionRule 
      end
    end

    context 'when promotional rule type is total_over' do
      let(:promotional_rule) { build_stubbed(:promotional_rule, :total_over) }

      it 'returns the instance of TotalOverPromotionRule class' do
        expect(described_class.for(promotional_rule.type, rule_details)).to be_a TotalOverPromotionRule
      end
    end

    context 'when promotional rule type is unknown' do
      it 'returns the instance of TotalOverPromotionRule class' do
        expect { described_class.for('free_shipping', build_stubbed(:promotional_rule, :total_over).rule_details) }.to raise_error(
          "'free_shipping' - unsupported type of promotional rule."
        )
      end
    end
  end
end
