describe Checkout do
  subject { described_class.new(promotional_rules) }

  let(:rule1) { build_stubbed(:promotional_rule, :quantity_equal_or_over) }
  let(:rule2) { build_stubbed(:promotional_rule, :total_over) }
  let(:promotional_rules) { [rule1, rule2] }

  let(:product1) { build_stubbed(:product, :red_scarf) }
  let(:product2) { build_stubbed(:product, :silver_cufflinks) }
  let(:product3) { build_stubbed(:product, :silk_dress) }
  let(:order1) { build_stubbed(:order, product: product1, quantity: 1) }
  let(:order2) { build_stubbed(:order, product: product2, quantity: 1) }
  let(:order3) { build_stubbed(:order, product: product3, quantity: 1) }
  let(:orders) { [order1, order2, order3] }

  let(:scan!) { orders.each { |order| subject.scan(order) } }

  describe '#initialize' do
    it 'initializes the promotional rules and orders' do
      expect(subject).to respond_to(:promotional_rules)
      expect(subject).to respond_to(:orders)
    end
  end

  describe '#scan' do
    before { scan! }

    it 'scans the order' do
      expect(subject.orders).to eq orders
    end
  end

  describe '#total' do
    before { scan! }

    it 'computes the total amount of orders' do
      expect(subject.total).to eq 66.78
    end

    context 'when ordering 2 red scarf and 1 silk dress' do
      let(:order1) { build_stubbed(:order, product: product1, quantity: 2) }
      let(:order2) { build_stubbed(:order, product: product2, quantity: 0) }

      it 'returns total amount 36.95' do
        expect(subject.total.round(2)).to eq 36.95
      end
    end

    context 'when ordering 2 red scarf, 1 silver cufflink, and 1 silk dress' do
      let(:order1) { build_stubbed(:order, product: product1, quantity: 2) }
      let(:order2) { build_stubbed(:order, product: product2, quantity: 1) }

      it 'returns total amount 73.76' do
        expect(subject.total.round(2)).to eq 73.76
      end
    end
  end
end
