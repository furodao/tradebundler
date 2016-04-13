class HomeController < ApplicationController

  def index
    if seller_signed_in? || buyer_signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
  end
end
