  class SessionsController < ApplicationController

    def new
    end


  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:blue] = "Account Access Granted"
      redirect_to root_path
    else
      flash.now[:purple] = "Key  Code  Or  Quext  Title  In  Invalid"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:blue] = "Quext Connection Severed"
    redirect_to login_path
  end

end
