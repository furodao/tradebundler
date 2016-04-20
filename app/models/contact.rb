class Contact < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller

  validates_uniqueness_of :buyer_id, :scope => [:seller_id]
end
