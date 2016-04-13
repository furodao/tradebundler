class SpecsController < ApplicationController
  before_action :set_spec, only: [:show, :edit, :update, :destroy]

  def index
    @specs = Spec.all
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
      params.require(:spec).permit(:buyer_id, :title, :description)
    end
end
