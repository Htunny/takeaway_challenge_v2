require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("menu") }

  let(:dishes) do
    {
      burger: 2,
      fries: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fries).and_return(true)
  end

  it 'selects several dishes from the menu' do
    order.add(:burger, 2)
    order.add(:fries, 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items that are not on the menu to be added' do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 1) }.to raise_error NoItemError, "Fish is not on the menu - Go somewhere else!"
  end

end
