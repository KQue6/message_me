  class SessionsController < ApplicationController
    before_action :logged_in_redirect, only; [:new, :create]

    def new
    end


  def create
    user = User.find_by(username: params[:session][:username]
    if user && user.authenticate(params[:session][:password]
      session[:user_id] = user.id
      flash[:blue] = "Account Access Granted"
      redirect_to root_path
    else
      flash.now[:purple] = "KeyCode/QuexTitle Not Correct"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:blue] = "Quext Connection Severed"
    redirect_to login_path
  end



private

def logged_in_redirect
  if logged_in?
    flash[:error] = "Quext Account Active"
    redirect_to root_path
  end
end

end
