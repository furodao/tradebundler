class ContactsController < ApplicationController
  before_action :authenticate_buyer_or_seller!
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
    if current_user_type == :seller
      @contacts = current_seller.contacts.collect(&:buyer)
    else
      @contacts = current_buyer.contacts.collect(&:seller)
    end
  end

  def show
    # fetch contact record
    if current_user_type == :buyer
      pair = current_user.contacts.where(seller_id: params[:id]).first
    else
      pair = current_user.contacts.where(buyer_id: params[:id]).first
    end

    # fetch corresponding buyer/seller
    if pair
      @contact = current_user_type == :seller ? pair.buyer : pair.seller
    end
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:seller_id, :buyer_id)
    end
end
