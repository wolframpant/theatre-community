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
      flash[:notice] = 'Please try again.'
      render :create
    end
  end

  def show
    @production = Production.find(params[:id])
    @play = Play.find_by(id: @production.play_id)
    @impressions = Impression.where(production_id: @production.id)
  end

  def index
    @play = Play.find(params[:play_id])
    @productions = Production.where(play_id: play.id)
  end

  private

  def production_params
    params.require(:production).permit(:company, :date_opened, :city, :state, :play_id)
  end

end