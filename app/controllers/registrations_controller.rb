
class RegistrationsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Account created successfully"
      redirect_to root_path
    else
      flash[:alert] = user.errors.first.full_message
      redirect_to "/signup"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end