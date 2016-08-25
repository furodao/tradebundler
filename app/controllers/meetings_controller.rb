class MeetingsController < ApplicationController

	def book_new_meeting
		@meeting = Meeting.new(meeting_params)
		if @meeting.save
			render status: 201, json: @meeting
		else
			render status: 400
		end
	end


	private

	def meeting_params
		params.require(:meeting).permit(:seller_id, :buyer_id, :offer_id, :place, :time)
	end
end
