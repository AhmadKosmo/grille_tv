class ProgrammesController < ApplicationController

  def index
    @programmes = Programme.all
    @realisateurs = Realisateur.all

    if (params[:search])
      @programme = Programme.where(titre: params[:search])
      params[:id] = @programme.ids
      render 'show'
    end

  end

  def new
    @programme = Programme.new
    @realisateurs = Realisateur.all

    @array_of_noms_realisateurs_ids_realisateurs =[]
    @realisateurs.each do |realisateur|
      a = [realisateur.nom, realisateur.id]
      @array_of_noms_realisateurs_ids_realisateurs.push(a)
    end

  end

  def create
    @programme = Programme.new(programme_params)

    if @programme.save
      flash[:notice] = "Le Programme a bien été créé"
      redirect_to programme_path(@programme)
    else
      render 'new'
    end
  end

  def show
    if (params[:search])
      @programme = Programme.where(titre: params[:search])
    else
      @programme = Programme.find(params[:id])
    end
  end

  def edit
    if (params[:search])
      # @programme = Programme.where(titre: params[:search])
      # params[:id] = @programme.ids
    end

    @programme = Programme.find(params[:id])
    @realisateurs = Realisateur.all

    @array_of_noms_realisateurs_ids_realisateurs =[]
    @realisateurs.each do |realisateur|
      a = [realisateur.nom, realisateur.id]
      @array_of_noms_realisateurs_ids_realisateurs.push(a)
    end
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
    params.require(:programme).permit(:titre, :type_programme, :classification, :realisateur_id)
  end
end
