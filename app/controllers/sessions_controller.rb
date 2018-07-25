class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
     # Log the user in and redirect to the user's show page.
     log_in user
     flash[:success] = "You have been succesfully logged in."
     redirect_to user
   else
     flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
     render 'new'
   end
 end

 def destroy

  log_out
  flash[:success] = "You have been succesfully logged out."
  redirect_to login_path
 end
end
