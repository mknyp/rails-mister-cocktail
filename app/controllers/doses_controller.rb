class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id]) # params is a hash and we have to call it by the right id
    @ingredients = Ingredient.all
    @dose = Dose.new # Empty instance to display in the form
  end
  def create
    @cocktail = Cocktail.find(params[:cocktail_id]) # find cocktail with id given in params and save in var
    @dose = Dose.new(dose_params) # create a dose with name/ingredient_id allowed in strong params
    # @dose.cocktail # this gives me back the cocktail instance that the dose belongs to
    @dose.cocktail = @cocktail # writing /setting the cocktail that the dose belongs to. here I give a cocktails ID to the dose (for the dose to exist it needs a cocktail id (and ingredient id))
    # similar to attr_accessor from OOP
    if @dose.save
      redirect_to cocktail_path(@cocktail) # this will go to '/cocktails/:id' of the @cocktail
    else
      render :new # rendering does not execute the new method (again), instead it only uses the view of NEW (to display validation errors when filling in the form)
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private
  # Only allow a trusted parameter "white list" through.
  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id) # here check what is coming in from the parameters
  end
end

