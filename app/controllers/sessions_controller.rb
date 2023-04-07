class SessionsController < ApplicationController 
  def new 
  end 

  def create 
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id 

      redirect_to root_path
    else 
      flash[:notice] = "Incorrect email or password"
      render :new
    end 
  end 

  def destroy 
    User.destroy(params[:id])

    redirect_to root_path, notice: "Successfully signed out"
  end 
end 