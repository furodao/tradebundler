class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :org
  has_many :offers

  def self.authenticate(email, password)
    seller = Seller.find_for_authentication(email: email)
    seller.valid_password?(password) ? seller : nil
  end
end
