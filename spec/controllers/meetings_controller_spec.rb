require 'rails_helper'

describe MeetingsController do
  describe 'book new meeting' do
    context 'Params are valid' do
      it "should create new meeting" do
        expect( response.status ).to eq 201
        post :book_new_meeting #, { 'Authorization' => "ArkivDigital demouser" }
      end
    end
  end
end
