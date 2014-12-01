class ProductionsController < ActionController::Base

  def new
    @production = Production.new
    @play = Play.find(params[:play_id])
  end

  def create
    @production = Production.new(production_params)
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
    @play = Play.find(params[:play_id])
    @impressions = Impression.where(production_id: @production.id)
  end

  def index
    @play = Play.find(params[:play_id])
    @productions = Production.where(play_id: play.id)
  end

  private

  def production_params
    params.require(:production).permit(:company, :date_opened, :city, :state)
  end

end