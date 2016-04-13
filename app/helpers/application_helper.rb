module ApplicationHelper

  def user_signed_in?
    seller_signed_in? || buyer_signed_in?
  end

  def sign_out_path
    if seller_signed_in?
      destroy_seller_session_path
    else
      destroy_buyer_session_path
    end
  end
end
