class ProductionsController < ApplicationController

  def new
    @play = Play.find(params[:play_id])
    @production = Production.new
    authorize @production
  end

  def create
    @production = Production.new(production_params)
    authorize @production
    if @production.save
      flash[:notice] = 'You have successfully added a production.'
      redirect_to @production
    else
      flash[:notice] = 'Please try again. Please make sure that the address you provided is valid.'
      redirect_to :back
    end
  end

  def show
    @production = Production.find(params[:id])
    @play = Play.find_by(id: @production.play_id)
    @impressions = Impression.where(production_id: @production.id)
  end

  def edit
    @production = Production.find(params[:id])
    @play = Play.find_by(:id => @production.play_id)
  end

  def update
    @production = Production.find(params[:id])
    @play = @production.play
    authorize(@production)
    if @production.update_attributes(production_params)
      redirect_to @play
      flash[:notice] = "Success!"
    else
      render :edit
      flash[:notice] = "Please try again."
    end
  end

  def destroy
    @production = Production.find(params[:id])
    authorize(@production)
    
    if @production.destroy
      flash[:notice] = "Your production has been removed."
      redirect_to plays_path
    else
      flash[:error] = "Production couldn't be deleted. Please try again."
      redirect_to plays_path
    end
  end

  private

  def production_params
    params.require(:production).permit(:company, :date_opened, :address, :city, :state, :country, :play_id, :latitude, :longitude)
  end

end