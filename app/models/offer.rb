class Offer < ApplicationRecord
  belongs_to :seller
  belongs_to :spec
  has_one :org, through: :seller

  before_create :set_status_pending

  def set_status_pending
    self.status = :pending
  end
end
