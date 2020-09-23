module ProductsHelper

  def product_available?
    productName = yield   
    Product.available? {productName} 
  end

end