class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]


  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:violet] = " You Won"
      redirect_to root_path
    else
      flash.now[:violet] = "Wrong Password Or UserName"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:violet] = "End Text Game"
    redirect_to login_path
  end



  private

  def logged_in_redirect
    if logged_in?
      flash[:teal] = "You Are Using Quext Now."
      redirect_to root_path
    end
  end

end
