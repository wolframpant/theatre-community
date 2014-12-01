class PlaysController < ActionController::Base

  def index
    @plays = Play.all
  end

  def show
    @play = Play.find(params[:id])
    @productions = Production.where(play_id: @play.id)
  end

end