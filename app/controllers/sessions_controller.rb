class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = "Ongi etorri GULAG-era!"
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Nickname-a edota pasahitza okerra(k)'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
