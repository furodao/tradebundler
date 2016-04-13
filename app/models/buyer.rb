class Buyer < ApplicationRecord
  belongs_to :org
  has_many :specs
end
