describe PromotionRule do
  subject { described_class.new(promotional_rule.rule_details) }

  let(:promotional_rule) { build_stubbed(:promotional_rule, :total_over) }

  describe '#initialize' do
    it 'initializes promotional rule' do
      expect(subject).to respond_to(:rule_details)
      expect(subject).to respond_to(:eligible?)
      expect(subject).to respond_to(:compute)
    end
  end

  describe '#eligible?' do
    it 'raises NotImplementedError' do
      expect { subject.eligible? }.to raise_error(NotImplementedError, "Method 'eligible?' must be implemented.")
    end
  end

  describe '#compute' do
    it 'raises NotImplementedError' do
      expect { subject.compute('test') }.to raise_error(NotImplementedError, "Method 'compute' must be implemented.")
    end
  end
end
