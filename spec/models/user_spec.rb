require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
 User.where(email: "1@test.com").destroy_all
        User.create!({
        first_name: "John",
        last_name: "doe",
        email: "1@test.com",
        password: "123456"
      })

      subject {
        described_class.new(first_name:'firstname', last_name: "Lastname",
                            email: "123@test.com", password: "123456")
      }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages.size).to be > 0
    end
    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages.size).to be > 0
    end
    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages.size).to be > 0
    end
    it "is not valid without a unique email" do
      subject.email = "12345@test.com"
      expect(subject).to_not be_valid
    end
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages.size).to be > 0
    end
    it "must have a password longer than 5 characters" do
      subject.password = "123"
      expect(subject).to_not be_valid
    end
  # Destory user here

  end
end
