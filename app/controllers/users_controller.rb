class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def show
    @user = User.find(params[:id])
    @impressions = Impression.where(user_id: @user.id)
    @comments = Comment.where(user_id: @user.id)
  end
  
  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:notice] = "Invalid User information"
      redirect_to edit_user_registration_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :avatar)
  end
  
  
end