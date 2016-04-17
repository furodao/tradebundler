class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :org
  has_many :offers
  has_many :specs, through: :offers
  has_many :contacts

  def self.authenticate(email, password)
    seller = Seller.find_for_authentication(email: email)
    seller.valid_password?(password) ? seller : nil
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
