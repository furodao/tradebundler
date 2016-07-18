class ContractsController < ApplicationController
  before_action :authenticate_buyer_or_seller!

	def index
		@contracts = Contract.where(seller_org_id: current_user.org_id).or(Contract.where(buyer_org_id: current_user.org_id)).uniq
	end
end
