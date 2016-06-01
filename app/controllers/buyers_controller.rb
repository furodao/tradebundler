class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]
  layout :set_layout

  def index
    @buyers = Buyer.all
  end

  def show
  end

  def dashboard
    @buyer = Buyer.find params[:buyer_id]
  end

  def new
    @buyer = Buyer.new
  end

  def edit
  end

  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      sign_in @buyer
      respond_to do |format|
        format.html { render 'dashboard', locals: { buyer_id: @buyer.id }, notice: "Välkommen till TradeBundler, #{@buyer.full_name}." }
      end
    else
      render :new
    end
  end

  def update
    if @buyer.update(buyer_params)
      redirect_to @buyer, notice: 'Buyer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @buyer.destroy
    redirect_to buyers_url, notice: 'Buyer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def buyer_params
      params.require(:buyer).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation, :org_id)
    end

    def set_layout
      case action_name
      when 'new' then 'landing_page'
      else 'application'
      end
    end
end
