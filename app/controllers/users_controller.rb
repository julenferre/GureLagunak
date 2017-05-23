class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create    
  	@user = User.new(user_params)
    if @user.save 
      flash.now[:success] = "Ongi etorri Gure Lagunak-era!"
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

  def show_photo
    @user = User.find(params[:id])
  end

  def show_pass
    @user = User.find(params[:id])
  end

  def show_destroy
    @user = User.find(params[:id])
  end

  def update_photo
    @user = User.find(params[:id])

    if @user.update_attribute(:profile_pic, params[:user][:profile_pic])
      flash.now[:success] = "Argazkia ondo eguneratu da!"
      redirect_to current_user
      # render html: "BAI :D"
    else
      render 'new'
      # render html: "Ez :("
    end
  end

  def update_password
    @user = User.find(params[:id])

    if @user.update(params.require(:user).permit(:password, :password_confirmation))
      flash.now[:success] = "Pasahitza ondo eguneratu da!"
      redirect_to current_user
      # render html: "BAI :DD"
    else
      render 'new'
      # render html: "Ez :("
    end
  end

  def destroy
    log_out
    User.find(params[:id]).destroy
    flash[:success] = "Erabiltzailea ondo ezabatu da."
    redirect_to root_url

  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :profile_pic, :password, :password_confirmation)
  end
end
