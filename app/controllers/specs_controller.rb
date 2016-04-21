class SpecsController < ApplicationController
  before_action :authenticate_buyer!, only: [:create, :edit, :update, :destroy, :new]
  before_action :authenticate_buyer_or_seller!, only: [:index]
  before_action :set_spec, only: [:show, :edit, :update, :destroy]

  def index
    if current_user_type == :buyer
      @specs = current_buyer.org.specs
    else
      @specs = Spec.all
    end
  end

  def show
  end

  def new
    @spec = Spec.new
  end

  def edit
  end

  def create
    @spec = Spec.new(spec_params)
    @spec.buyer = current_buyer

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
      params.require(:spec).permit(:buyer_id, :title, :description, :contact_date, :budget, :spec_category_id)
    end
end
