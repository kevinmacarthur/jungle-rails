class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, length: { minimum: 5 }


  def authenticate_with_credentials(email, password)
    lowercaseEmail = email.downcase
    strippedEmail = lowercaseEmail.delete(' ')
    user = User.find_by(email: strippedEmail)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
