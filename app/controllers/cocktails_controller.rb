class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

  def index # GET /cocktails
    @cocktails = Cocktail.all
  end

  def show # GET /cocktails/1
    # @cocktail = Cocktail.find(params[:id]) # refactoring >>> own method below + before_action
  end

  def new # GET /cocktails/new
    @cocktail = Cocktail.new # Empty instance of the cocktail to display in the form (=> new view)
  end

  def create # POST /cocktails
    @cocktail = Cocktail.new(cocktail_params)
    # @cocktail.save # outdated since if logic is better
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id), notice: 'Cocktail was successfully created.' # define where to go to after submitting form (site will reload)
    else
      render(:new) # rendering does not execute the new method (again), instead it only uses the view of new (to display errors when filling in the form)
    end
  end

  def edit # GET /cocktails/1/edit
    # @cocktail = Cocktail.find(params[:id]) # refactoring >>> own method below + before_action
  end

  def update  # PATCH/PUT /cocktails/1
    # @cocktail = Cocktail.find(params[:id]) # refactoring >>> own method below + before_action
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail.id), notice: 'Cocktail was successfully updated.'
  end

  def destroy # DELETE /cocktails/1
    # @cocktail = Cocktail.find(params[:id]) # refactoring >>> own method below + before_action
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail # to be used in combination with the before_action from the top
    @cocktail = Cocktail.find(params[:id])
  end
end
