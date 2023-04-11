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
    @user = User.find_signed(params[:token], purpose: "password_reset")

    rescue ActiveSupport::MessageVerifier::InvalidSignature 
      flash[:alert] = "The link has expired"
      redirect_to password_resets_path
  end 

  def update 
    user = User.find_signed(params[:token], purpose: "password_reset")
    if user.update(password_params)
      flash[:notice] = "You have successfully updated the password"
      redirect_to new_session_path
    else 
      flash[:alert] = "Something went wrong. please try again"
      redirect_to edit_password_reset_path(token: params[:token])
    end 
  end 

  private 

  def password_params 
    params.require(:user).permit(:password, :password_confirmation)
  end 
end 