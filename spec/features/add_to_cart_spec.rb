require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
        @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'They see 1 item in shopping cart after click' do
    # ACT
    visit root_path
    first('.product').click_on('Add')
    sleep(1)

    # DEBUG
    save_screenshot('After.png')

    # VERIFY
    expect(page).to have_css('li.shopping-cart', text: "My Cart (1)")
  end
end
