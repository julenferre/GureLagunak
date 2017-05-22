class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save and @user.password == @user.password_confirmation 
      # flash[:success] = "Ongi etorri GULAG-era!"
      render html: "BAI :D"
    else
      # render 'new'
      render html: "Ez :("
    end 
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
    	  params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
    end
end
