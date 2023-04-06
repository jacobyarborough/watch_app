class ApplicationController < ActionController::Base
  before_action :set_current_user 

  def set_current_user 
    if sessions[:user_id]
      Current.user = User.find_by(session[:user_id])
    end 
  end 
end
