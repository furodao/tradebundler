class Meeting < ApplicationRecord
	belongs_to :seller
	belongs_to :buyer
	belongs_to :offer

	before_create :set_status_pending

	private
	def set_status_pending
		self.status = :pending
	end
end
