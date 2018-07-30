class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
     # Log the user in and redirect to the user's show page.

     log_in user
     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
     flash[:success] = "You have been succesfully logged in."
     redirect_back_or user
   else
     flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
     render 'new'
   end
 end

 def destroy

  log_out if logged_in?
  flash[:success] = "You have been succesfully logged out."
  redirect_to login_path
 end
end
