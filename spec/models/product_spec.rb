require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

      subject {
        @category = Category.find_or_create_by! name: 'Apparel'
        described_class.new(name:'test', description: "Lorem ipsum",
                            quantity: 1, price_cents: 64.99, category_id: @category.id)
      }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages.size).to be > 0
    end
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages.size).to be > 0
    end
    it "is not valid without a category" do
      subject.category_id = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages.size).to be > 0
    end
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages.size).to be > 0
    end
  end
end
