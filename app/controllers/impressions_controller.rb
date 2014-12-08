class ImpressionsController < ApplicationController

  def show
    @impression = Impression.find(params[:id])
    @play = Play.find_by(id: @impression.play_id)
    @production = Production.find_by(id: @impression.production_id)
    @comments = Comment.where(impression_id: @impression.id)
  end

  def new
    @production = Production.find(params[:production_id])
    @impression = Impression.new
    authorize @impression
  end

  def create
    @impression = Impression.new(impression_params)
    @production = Production.find_by(id: @impression.production_id)
    authorize @impression
    if @impression.save
      flash[:notice] = 'You have successfully added an impression.'
      redirect_to @impression
    else
      flash[:notice] = 'Please try again.'
      render :new
    end
  end

  def edit
    @impression = Impression.find(params[:id])
    authorize @impression
  end

  def update
    @impression = Impression.find(params[:id])
    authorize @impression
    if @impression.update_attributes(params.require(:impression).permit(:title, :body))
      redirect_to play_path
      flash[:notice] = "Success!"
    else
      render :edit
      flash[:notice] = "Please try again."
    end
  end

  def destroy
    @impression = Impression.find(params[:id])
    authorize(@impression)
    
    if @impression.destroy?
      flash[:notice] = "Your impression has been removed."
      redirect_to production_path
    else
      flash[:error] = "Production couldn't be deleted. Please try again."
      redirect_to production_path
    end
  end

private

  def impression_params
    params.require(:impression).permit(:title, :body, :production_id)
  end
  
end