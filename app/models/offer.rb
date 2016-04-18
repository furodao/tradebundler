class Offer < ApplicationRecord
  belongs_to :seller
  belongs_to :spec
  has_one :org, through: :seller
end
