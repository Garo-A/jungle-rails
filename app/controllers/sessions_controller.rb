class SessionsController < ApplicationController

  #LOGING
  def new
  end

  #CHECK LOGING
  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  #LOGOUT
  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
