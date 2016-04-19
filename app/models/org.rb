class Org < ApplicationRecord
  has_many :buyers
  has_many :sellers
  has_many :specs, through: :buyers
  has_many :offers, through: :sellers
end
