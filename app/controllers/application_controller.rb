class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  def authenticate_buyer!
    buyer_signed_in? ? true : (redirect_to sign_in_path)
  end

  def authenticate_seller
    seller_signed_in? ? true : (redirect_to sign_in_path)
  end

  def authenticate_buyer_or_seller!
    user_signed_in? ? true : (redirect_to sign_in_path)
  end

  def current_user
    current_user_type == :seller ? current_seller : current_buyer
  end
end
