
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    before (:each) do
      @category= Category.new(name:'category')
    end

    it 'A product with all four fields' do
    @product = Product.new(name: 'product1', category:@category, quantity: 3, price_cents: 100)
      expect(@product ).to be_valid
    end
    
    it 'A product with name nil' do
      @product = Product.new(category:@category, quantity:3, price_cents: 100)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
      
  end

  it 'A product with no category' do
    @product = Product.new(name: 'product1', quantity: 3, price_cents:100)
    @product.save
    expect(@product.errors.full_messages).to include("Category must exist")
  end

  it 'A product with no quanity' do
    @product = Product.new(name: 'product1', category:@category, price_cents:100)
    @product.save
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end
  it 'A product with no price' do
    @product = Product.new(name: 'product1', category:@category, quantity: 3)
    @product.save
    expect(@product.errors.full_messages).to include("Price is not a number")
  end

  end
 
end

