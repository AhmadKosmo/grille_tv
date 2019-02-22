class ChainesController < ApplicationController

  def index
    @chaines = Chaine.all

    if (params[:search])
      @chaines = Chaine.where(nom: params[:search])
      @chaine = @chaines.first
      render 'show'
    end
  end


  def new
    @chaine = Chaine.new
  end

  def create
    @chaine = Chaine.new(chaine_params)

    if @chaine.save
      flash[:notice] = "La Chaine a bien été créée"
      redirect_to chaine_path(@chaine)
    else
      render 'new'
    end
  end

  def show
    @chaine = Chaine.find(params[:id])
  end

  def edit
    @chaine = Chaine.find(params[:id])
  end

  def update
    @chaine = Chaine.find(params[:id])

    if @chaine.update(chaine_params)
      flash[:notice] = "La chaine a bien été modifié"
      redirect_to chaine_path(@chaine)
    else
      render 'edit'
    end
  end

  def destroy
    @chaine = Chaine.find(params[:id])
    @chaine.destroy
    flash[:notice] = "La Chaine a bien été supprimée"
    redirect_to chaines_path
  end

  private
  def chaine_params
    params.require(:chaine).permit(:nom)
  end

end
