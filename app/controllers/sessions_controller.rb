class SessionsController < ApplicationController
  
  skip_before_action :authorize
  def new
  end

  def create
  	user = Log.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:log_id] = user.id 
  		redirect_to pdfs_path, notice: 'logged in'
  	else
  		redirect_to login_url, alert: "invalid email or password"
  	end
  end

  def destroy
  	session[:log_id] = nil
  	redirect_to root_url, notice: 'logged out'
  end
end
