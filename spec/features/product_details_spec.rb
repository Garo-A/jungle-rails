RSpec.feature "Visitor navigates to product page", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  "Test Product",
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Thy visit the home page and click on a product" do
    visit root_path
    click_link("Test Product", href: product_path(id:1))
    find(".products-show")
    expect(page).to have_css("section.products-show")
  end



end
