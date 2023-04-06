class SessionsCOntroller < ApplicationController 
  def destroy 
    User.destroy(params[:id])
  end 
end 