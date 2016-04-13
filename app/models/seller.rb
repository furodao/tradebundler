class Seller < ApplicationRecord
  belongs_to :org
  has_many :offers
end
