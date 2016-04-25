class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    if current_user_type == :seller
      @offers = current_seller.org.offers
    else
      @offers = current_buyer.offers
    end
  end

  def show
  end

  def new
    @offer = Offer.new
    @spec = Spec.find(params[:spec_id])
  end

  def edit
    @spec = Spec.find(params[:spec_id])
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.spec_id = params[:offer][:spec_id]
    @offer.seller = current_seller

    if @offer.save
      redirect_to offers_path, notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_url, notice: 'Offer was successfully destroyed.'
  end

  def accept
    @offer = Offer.find(params[:offer_id])

    if @offer
      Contact.create(seller_id: @offer.seller_id, buyer_id: @offer.spec.buyer_id)
      @offer.update_attribute :status, :accepted
      redirect_to @offer, notice: 'Offerten accepterad.'
    else
      redirect_to offers_url, notice: 'Offerten hittades ej!'
    end
  end

  def reject
    @offer = Offer.find(params[:offer_id])
    if @offer
      @offer.update_attribute :status, :rejected
      redirect_to @offer, notice: 'Offerten avlagen.'
    else
      redirect_to offers_url, notice: 'Offerten hittades ej!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:offer).permit(:seller_id, :spec_id, :description, :budget, :delivery_date, {docs: []})
    end
end
