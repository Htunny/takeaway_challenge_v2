require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      burger: 5.00,
      fries: 3.00,
      shake: 2.50
    }
  end
  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Burger £5.00, Fries £3.00, Shake £2.50"
    expect(menu.print).to eq(printed_menu)
  end
end
