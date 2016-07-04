class SessionsController < ApplicationController

  def new
  end

  def create
    user = Buyer.find_by_email(params[:seller][:email]) || Seller.find_by_email(params[:seller][:email])

    if user.nil?
      render :new
    elsif user.class.authenticate(params[:seller][:email], params[:seller][:password])
      sign_in(user)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
  end

end
