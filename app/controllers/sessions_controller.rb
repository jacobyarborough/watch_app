class SessionsController < ApplicationController 
  def destroy 
    User.destroy(params[:id])

    redirect_to root_path, notice: "Successfully signed out"
  end 
end 