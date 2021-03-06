class DiffusionsController < ApplicationController
  def index

    @programmes = Programme.all
    @chaines = Chaine.all

    if (params[:jour] && params[:heure])
      @diffusions = Diffusion.where(jour: params[:jour], heure: params[:heure])
    else
      @diffusions = Diffusion.paginate(page: params[:page], per_page: 8)
    end

    @diffusions_tmp = Diffusion.all
    @array_of_heures_heures =[]
    @diffusions_tmp.each do |diffusion|
      a = [diffusion.heure, diffusion.heure]
      @array_of_heures_heures.push(a) unless @array_of_heures_heures.include?(a)
    end

    @array_of_heures_heures = @array_of_heures_heures.sort

    @array_of_jours_jours =[]
    @diffusions_tmp.each do |diffusion|
      a = [diffusion.jour, diffusion.jour]
      @array_of_jours_jours.push(a) unless @array_of_jours_jours.include?(a)
    end

    @array_of_jours_jours = @array_of_jours_jours.sort

  end

  def new
    @diffusion = Diffusion.new
    @programmes = Programme.all

    @array_of_noms_programmes_ids_programmes =[]
    @programmes.each do |programme|
      a = [programme.titre, programme.id]
      @array_of_noms_programmes_ids_programmes.push(a)
    end

    @chaines = Chaine.all

    @array_of_noms_chaines_ids_chaines =[]
    @chaines.each do |chaine|
      a = [chaine.nom, chaine.id]
      @array_of_noms_chaines_ids_chaines.push(a)
    end
  end

  def create
    @diffusion = Diffusion.new(diffusion_params)

    if @diffusion.save
      flash[:success] = "La Diffusion a bien été créée"
      redirect_to diffusion_path(@diffusion)
    else
      render 'new'
    end
  end

  def show
    @diffusion = Diffusion.find(params[:id])
    @programme = Programme.find(@diffusion.programme_id)
    @chaine = Chaine.find(@diffusion.chaine_id)
  end

  def edit
    @diffusion = Diffusion.find(params[:id])
    @programme = Programme.find(@diffusion.programme_id)
    @chaine = Chaine.find(@diffusion.chaine_id)


    @programmes = Programme.all

    @array_of_noms_programmes_ids_programmes =[]
    @programmes.each do |programme|
      a = [programme.titre, programme.id]
      @array_of_noms_programmes_ids_programmes.push(a)
    end

    @chaines = Chaine.all

    @array_of_noms_chaines_ids_chaines =[]
    @chaines.each do |chaine|
      a = [chaine.nom, chaine.id]
      @array_of_noms_chaines_ids_chaines.push(a)
    end
  end


  def update
    @diffusion = Diffusion.find(params[:id])

    if @diffusion.update(diffusion_params)
      flash[:success] = "La diffusion a bien été modifiée"
      redirect_to diffusion_path(@diffusion)
    else
      render 'edit'
    end
  end

  def destroy
    @diffusion = Diffusion.find(params[:id])
    @diffusion.destroy
    flash[:danger] = "La diffusion a bien été supprimée"
    redirect_to diffusions_path
  end

  private
  def diffusion_params
    params.require(:diffusion).permit(:jour, :heure, :programme_id, :chaine_id)
  end

end
