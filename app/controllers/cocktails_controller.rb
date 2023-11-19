class CocktailsController < ApplicationController
  before_action :set_active_storage_url_options, only: [:index]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was created!'
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path, notice: 'Cocktail was successfully destroyed.'
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :image,  doses_attributes: [:id, :description, :ingredient_id, :_destroy])
  end

  def set_active_storage_url_options
    ActiveStorage::Current.url_options = {
      host: request.host,
      protocol: request.protocol,
      port: request.port
    }
  end
end
