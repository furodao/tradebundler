class Spec < ApplicationRecord
  belongs_to :buyer
  has_one :org, through: :buyer
end
