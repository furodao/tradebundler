class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  layout :set_layout

  def index
    if current_user.role == 'superadmin'
      @sellers = Seller.all
    else
      redirect_to dashboard_path
    end
  end

  def show
  end

  def dashboard
    @seller = Seller.find params[:seller_id]
  end

  def new
    @seller = Seller.new
  end

  def edit
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      sign_in @seller
      respond_to do |format|
        format.html { render 'dashboard', locals: { seller_id: @seller.id }, notice: "Välkommen till TradeBundler, #{@seller.full_name}." }
      end
    else
      render :new
    end
  end

  def update
    if @seller.update(seller_params)
      redirect_to @seller, notice: 'Seller was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @seller.destroy
    redirect_to sellers_url, notice: 'Seller was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def seller_params
      params.require(:seller).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation, :org_id)
    end

    def set_layout
      case action_name
      when 'new' then 'landing_page'
      else 'application'
      end
    end
end
