class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def delete
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
