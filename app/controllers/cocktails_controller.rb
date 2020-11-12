class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    # @cocktail = Cocktail.find(params[:id]) # refactoring >>> own method below + before_action
  end

  def new
    @cocktail = Cocktail.new # Empty instance of the cocktail to display in the form
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # @cocktail.save # outdated since if logic is better
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render(:new) # rendering does not execute the new method, instead it only uses the view of new
    end
  end

  def edit
    # @cocktail = Cocktail.find(params[:id]) # refactoring >>> own method below + before_action
  end

  def update
    # @cocktail = Cocktail.find(params[:id]) # refactoring >>> own method below + before_action
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail.id)
  end

  def destroy
    # @cocktail = Cocktail.find(params[:id]) # refactoring >>> own method below + before_action
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail # to be used in combination with the before_action from the top
    @cocktail = Cocktail.find(params[:id])
  end
end
