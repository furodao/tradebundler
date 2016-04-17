class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :org
  has_many :specs
  has_many :contacts

  def self.authenticate(email, password)
    buyer = Buyer.find_for_authentication(email: email)
    buyer.valid_password?(password) ? buyer : nil
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
