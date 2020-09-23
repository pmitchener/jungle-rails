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


  scenario "User can add to cart and cart count increase by 1" do
    visit root_path
    click_button('Add', :match => :first)
    #sleep(1)
    # commented out b/c it's for debugging only
    #save_and_open_screenshot "AddToCartPage.png"

    expect(page).to have_text 'My Cart (1)'
  end
end
