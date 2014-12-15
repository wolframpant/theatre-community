class ImagesController < ApplicationController

  def show
    @image = Image.find(params[:id])
    @impression = Impression.find_by(id: @image.impression_id)
  end
  
  def new
    @impression = Impression.find(params[:impression_id])
    @image = Image.new
    authorize @image
  end

  def create
    @image = Image.new(image_params)
    @impression = Impression.find_by(id: @image.impression_id)
    authorize @image
    if @image.save
      flash[:notice] = 'You have successfully added an image.'
      redirect_to @impression
    else
      flash[:notice] = 'Please try again.'
      render :new
    end
  end
  
  def destroy
    @image = Image.find(params[:id])
    @impression = Impression.find_by(:id => @image.impression_id)
    authorize(@image)
    
    if @image.destroy
      flash[:notice] = "Your image has been removed."
      redirect_to @impression
    else
      flash[:error] = "Image couldn't be deleted. Please try again."
      redirect_to @impression
    end
  end

  private

    def image_params
      params.require(:image).permit(:name, :location, :impression_id)
    end

end