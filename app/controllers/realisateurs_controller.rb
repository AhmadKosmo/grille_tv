class RealisateursController < ApplicationController

  def index
    @realisateurs = Realisateur.paginate(page: params[:page], per_page: 8)

    if (params[:search])
      @realisateurs = Realisateur.where(nom: params[:search])
      @realisateur = @realisateurs.first
      render 'show'
    end

  end

  def new
    @realisateur = Realisateur.new
  end

  def create
    @realisateur = Realisateur.new(realisateur_params)
    if @realisateur.save
      flash[:success] = "Le Réalisateur a bien été créé"
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
      flash[:success] = "Réalisateur a bien été modifié"
      redirect_to realisateur_path(@realisateur)
    else
      render 'edit'
    end
  end

  def destroy
    @realisateur = Realisateur.find(params[:id])
    @realisateur.destroy
    flash[:danger] = "Le Réalisateur a bien été supprimé"
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
