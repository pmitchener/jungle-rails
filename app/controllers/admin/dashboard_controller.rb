class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count
    @catetory_count = Category.count
  end
end
