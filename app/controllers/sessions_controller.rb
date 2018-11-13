class SessionsController < ApplicationController

  def new
  end

  def create
    lowercaseEmail = params[:email].downcase
    strippedEmail = lowercaseEmail.delete(' ')
    @user = User.find_by_email(strippedEmail)
    # If the user exists AND the password entered is correct.
    if @user == @user.authenticate_with_credentials(strippedEmail, params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    update_cart({})
    redirect_to '/'
  end
end
