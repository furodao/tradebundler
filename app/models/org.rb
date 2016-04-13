class Org < ApplicationRecord
  has_many :buyers
  has_many :sellers
end
