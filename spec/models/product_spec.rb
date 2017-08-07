require 'rails_helper'

RSpec.describe Product, type: :model do
   describe "Validations" do
     before do
       @category = Category.new(name: "TestCat")
     end

     it "Should not save if there is not name" do
       @product = Product.new(
        price: $200,
        quantity: 40,
        category: @category
       )
       result = @product.save
       expect(result).to be(false)
     end

     it "Should not save if there is no price" do
       @product = Product.new(
        name: "TEST",
        quantity: 40,
        category: @category
       )
       result = @product.save
       expect(result).to be(false)
     end

     it "Should not save if there is no quantity" do
       @product = Product.new(
        name: "TEST",
        price: 200,
        category: @category
       )
       result = @product.save
       expect(result).to be(false)
     end

     it "Should not save if there is no category" do
       @product = Product.new(
        name: "TEST",
        quantity: 40,
        price: 200
       )
       result = @product.save
       expect(result).to be(false)
     end

     it "Should save correctly when all fields are present" do
       @product = Product.new(
        name: "TEST",
        quantity: 40,
        price: 200,
        category: @category
       )
       result = @product.save
       expect(result).to be(true)
     end

   end
end


# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true
