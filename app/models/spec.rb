class Spec < ApplicationRecord
  belongs_to :buyer
  has_one :org, through: :buyer
  has_many :offers

  def accepted?
    self.offers.any? { |offer| offer.status == 'accepted' }
  end
end
