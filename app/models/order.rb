class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  before_create :checkStock
  after_create :updateProducts

  def updateProducts
    self.line_items.each do |item|
        newQuantity = item.product.quantity - item.quantity
        product = Product.find_by(id: item.product.id)
        product.update(quantity: newQuantity)
    end
  end

  def checkStock
    self.line_items.each do |item|
      newQuantity = item.product.quantity - item.quantity
      if newQuantity >= 0
        puts "Have enough stock for order"
      else
        puts "SORRY ONLY HAVE #{item.product.quantity} #{item.product.name} in stock "
        fail
      end
    end
  end
end