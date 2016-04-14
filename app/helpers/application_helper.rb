module ApplicationHelper

  def current_user_type
    if seller_signed_in?
      return :seller
    elsif buyer_signed_in?
      return :buyer
    else
      :no_user
    end
  end

  def user_signed_in?
    seller_signed_in? || buyer_signed_in?
  end

  def sign_out_path
    if seller_signed_in?
      destroy_seller_session_url
    elsif buyer_signed_in?
      destroy_buyer_session_url
    end
  end
end
