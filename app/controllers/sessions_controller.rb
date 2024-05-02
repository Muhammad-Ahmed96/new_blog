
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you are now logged in!"
      redirect_to root_path
    else
      flash[:alert] = "Invalid username or password"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logout successfully"
    redirect_to root_path
  end

end