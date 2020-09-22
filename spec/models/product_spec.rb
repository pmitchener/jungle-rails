require 'rails_helper'
require 'product'
require 'category'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'product with all fields should save successfully' do
      @category = Category.new(name: "testCategory")
      @category.save
      @product = @category.products.new(name: "Product 1", description: "description 1", image: "", price_cents: 12000, quantity: 12)
      @product.save
      expect(@product.errors.any?).to be(false)
    end
    
    it 'should have name' do
      @category = Category.new(name: "testCategory")
      @category.save
      @product = @category.products.new(name: nil, description: "description 1", image: "", price_cents: 12000, quantity: 12)
      @product.save

      expect(@product.errors[:name].any?).to be(true)
    end

    it 'should have price' do
      @category = Category.new(name: "testCategory")
      @category.save
      @product = @category.products.new(name: "product 1", description: "description 1", image: "", price_cents: nil, quantity: 12)
      @product.save

      expect(@product.errors[:price].any?).to be(true)
    end

    it 'should have quantity' do
      @category = Category.new(name: "testCategory")
      @category.save
      @product = @category.products.new(name: "product 1", description: "description 1", image: "", price_cents: 1200, quantity: nil)
      @product.save

      expect(@product.errors[:quantity].any?).to be(true)
    end

    it 'should have category' do
      @product = Product.new(category_id: nil, name: "product 1", description: "description 1", image: "", price_cents: 1200, quantity: 12)
      @product.save

      expect(@product.errors[:category].any?).to be(true)
    end

  end
end


