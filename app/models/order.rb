class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
  validate :checkStock

  after_create :updateProducts

  def updateProducts
    self.line_items.each do |item|
        newQuantity = item.product.quantity - item.quantity
        product = Product.find_by(id: item.product.id)
        product.update(quantity: newQuantity)
    end
  end

  private

  def checkStock
    valid = true
    self.line_items.each do |item|
      newQuantity = item.product.quantity - item.quantity
      if newQuantity >= 0
      else
        self.errors[:quantity] << "Error: Have #{item.product.quantity} #{item.product.name} left in stock, You ordered #{item.quantity}"
        valid = false
      end
    end
    valid
  end
end