class Contract < ActiveRecord::Base
	has_many :orgs
  belongs_to :buyer
  belongs_to :seller
end
