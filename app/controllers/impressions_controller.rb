class ImpressionsController < ActionController::Base

  def show
    @impression = Impression.find(params[:id])
    @play = Play.find_by(id: @impression.play_id)
    @production = Production.find_by(id: @impression.production_id)
    @comments = Comment.where(impression_id: @impression.id)
  end

end