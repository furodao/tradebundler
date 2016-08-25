class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :org
  has_many :offers
  has_many :specs, through: :offers
  has_many :contacts
	has_many :contracts
	has_many :meetings

  before_create :set_default_role

  def self.authenticate(email, password)
    seller = Seller.find_for_authentication(email: email)
    seller.valid_password?(password) ? seller : nil
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def offer_for(spec)
    self.offers.find_by(spec_id: spec.id)
  end

  private
  def set_default_role
    self.role = self.role.nil? ? 'seller' : self.role
  end
end
