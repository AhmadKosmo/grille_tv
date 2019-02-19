class RealisateursController < ApplicationController

  def index
    @realisateurs = Realisateur.all
  end

  def new
    @realisateur = Realisateur.new
  end

  def create
    @realisateur = Realisateur.new(realisateur_params)
    if @realisateur.save
      flash[:notice] = "Le Réalisateur a bien été créé"
      redirect_to realisateur_path(@realisateur)
    else
      render 'new'
    end
  end

  def edit
    @realisateur = Realisateur.find(params[:id])
  end

  def update
    @realisateur = Realisateur.find(params[:id])
    if @realisateur.update(realisateur_params)
      flash[:notice] = "Réalisateur a bien été modifié"
      redirect_to realisateur_path(@realisateur)
    else
      render 'edit'
    end
  end

  def destroy
    @realisateur = Realisateur.find(params[:id])
    @realisateur.destroy
    flash[:notice] = "Le Réalisateur a bien été supprimé"
    redirect_to realisateurs_path
  end

  def show
    @realisateur = Realisateur.find(params[:id])
  end

  private
  def realisateur_params
    params.require(:realisateur).permit(:nom)
  end

end
