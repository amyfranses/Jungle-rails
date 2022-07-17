require 'rails_helper'

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true


RSpec.describe Product, type: :model do

  describe 'Validations' do
  
    it "is valid with valid attributes: name, price, quantity and category" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = "test"
      @product.price = 100
      @product.quantity = 100
      @product.category_id = @category

      @category.products = [@product]

      @product.save

      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = nil
      @product.price = 100
      @product.quantity = 100
      @product.category_id = @category

      @category.products = [@product]

      @product.save

      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = "test"
      @product.price_cents = nil
      @product.quantity = 100
      @product.category_id = @category

      @category.products = [@product]

      @product.save

      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = "test"
      @product.price = 100
      @product.quantity = nil
      @product.category_id = @category

      @category.products = [@product]

      @product.save

      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
       @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = nil
      @product.price = 100
      @product.quantity = 100
      @product.category_id = nil

      @category = [@product]

      @product.save

      expect(@product).to_not be_valid
    end
  end
end


