class ProgrammesController < ApplicationController

  def index
    @programmes = Programme.all
  end

  def new
    @programme = Programme.new
  end

  def create
  @programme = Programme.new(programme_params)
  # @programme.user = User.first
  if @programme.save
    flash[:notice] = "Pogramme was successfully created"
  redirect_to programme_path(@programme)
  else
    render 'new'
  end
  end

  def show
    @programme = Programme.find(params[:id])
  end

  def edit
    @programme = Programme.find(params[:id])
  end

  def update
    @programme = Programme.find(params[:id])
  if @programme.update(programme_params)
    flash[:notice] = "Programme a bien été modifié"
  redirect_to programme_path(@programme)
  else
    render 'edit'
  end
  end

  def destroy
    @programme = Programme.find(params[:id])
  @programme.destroy
  flash[:notice] = "Le programme a bien été supprimé"
  redirect_to programmes_path
  end

  private
  def programme_params
    params.require(:programme).permit(:titre, :type_programme, :classification)
  end
end
