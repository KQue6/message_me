class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Quext Credentials Accepted"
      redirect_to root_path
    else
      flash.now[:error] = "Login Credentials Not Corrrect"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You Have Logged Out Of Quext"
    redirect_to login_path
  end

end
