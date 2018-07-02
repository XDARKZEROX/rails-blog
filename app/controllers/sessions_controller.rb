class SessionsController < ApplicationController
 # says to the computer “Create me a form for the sessions controller, 
 # and submit it to the URL login_path which was defined in config/routes.rb”
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in'
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'There was something wrong with the login'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out'
    redirect_to root_path
  end

end
