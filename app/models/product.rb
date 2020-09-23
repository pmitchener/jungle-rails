
class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

    # Class method. using Active record scope.
    def self.available?
      productName = yield
      where("products.name = ? AND products.quantity > 0", productName).any?
    end
    
end
