class PasswordResetsController < ApplicationController 
  def new 
  end 

  def create 
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
      # PasswordMailer.with(user: @user).reset.deliver_now
    end 

    redirect_to root_path, notice: "If the email is on file we will send a link"
  end 

  def edit 
  end 

  def update 
  end 
end 