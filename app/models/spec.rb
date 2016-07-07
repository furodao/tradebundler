class Spec < ApplicationRecord
  belongs_to :buyer
  has_one :org, through: :buyer
  has_many :offers
  belongs_to :spec_category

	def self.by_category(id)
		id.blank? ? self.all : self.where(spec_category_id: id)
	end

  def status
    accepted? ? 'accepted' : nil
  end

  def accepted?
    self.offers.any? { |offer| offer.status == 'accepted' }
  end

  def pending?
    self.offers.none? { |offer| offer.status == 'accepted' }
  end
end
