class Org < ApplicationRecord
  has_many :buyers
  has_many :sellers
  has_many :specs, through: :buyers
end
