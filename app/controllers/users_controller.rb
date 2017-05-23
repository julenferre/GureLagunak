class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create    
  	@user = User.new(user_params)
    if @user.save 
      flash.now[:success] = "Ongi etorri GULAG-era!"
      redirect_to root_path
      # render html: "BAI :D"
    else
      render 'new'
      # render html: "Ez :("
    end 
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :profile_pic, :password, :password_confirmation)
  end
end
