class Contract < ApplicationRecord
	belongs_to :seller_org, class_name: :Org, foreign_key: :seller_org_id
	belongs_to :buyer_org, 	class_name: :Org, foreign_key: :buyer_org_id
	belongs_to :offer
	belongs_to :spec
end
