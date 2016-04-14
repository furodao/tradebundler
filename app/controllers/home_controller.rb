class HomeController < ApplicationController

  def index
    if seller_signed_in? || buyer_signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
    if current_user_type == :seller 
      redirect_to seller_dashboard_path(current_seller)
    elsif current_user_type == :buyer
      redirect_to buyer_dashboard_path(current_buyer)
    else
      index
    end
  end

  def current_user_type
    if seller_signed_in?
      return :seller
    elsif buyer_signed_in?
      return :buyer
    else
      :no_user
    end
  end
end
