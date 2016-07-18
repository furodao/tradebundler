class SpecsController < ApplicationController
  before_action :authenticate_buyer!, only: [:create, :edit, :update, :destroy, :new]
  before_action :authenticate_buyer_or_seller!, only: [:index]
  before_action :set_spec, only: [:show, :edit, :update, :destroy]

  def index
    if current_user_type == :buyer
      @specs = current_buyer.org.specs.order(:deadline)
    else
      @specs = Spec.by_category(filter_category).by_status(filter_status)
    end
  end

  def show
    if params[:selected_offer]
      @offer = Offer.find(params[:selected_offer]) if params[:selected_offer]
    elsif @spec.accepted?
      @offer = @spec.offers.detect{ |o| o.accepted? }
    end
  end

  def new
    @spec = Spec.new
  end

  def edit
  end

  def create
    @spec = Spec.new(spec_params.except(:custom_checks))
    @spec.buyer = current_buyer

    custom_checks = []
    params[:spec][:custom_checks].each do |attr|
      custom_checks << { id: SecureRandom.hex(4), title: attr }
    end
    @spec.custom_checks = custom_checks

    if @spec.save
      redirect_to @spec, notice: 'Spec was successfully created.'
    else
      render :new
    end
  end

  def update
    if @spec.update(spec_params)
      redirect_to @spec, notice: 'Spec was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @spec.destroy
    redirect_to specs_url, notice: 'Spec was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec
      @spec = Spec.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spec_params
      params.require(:spec).permit(:buyer_id, :title, :description, :contact_date, :budget, :spec_category_id, :deadline, :delivery_date, custom_checks: [])
    end

		def filter_category
			params[:spec_category_id]
		end

		def filter_status
			params[:spec_status]
		end
end
