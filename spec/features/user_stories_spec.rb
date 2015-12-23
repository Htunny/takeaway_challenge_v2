require 'takeaway'

feature 'Menu' do
 let(:takeaway) {Takeaway.new}
 
  scenario 'see list of dishes on menu' do
   expect(takeaway.show_menu).to eq 'Burger £5.00, Fries £3.00, Shake £2.50'
  end
end
