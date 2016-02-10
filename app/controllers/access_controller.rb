class AccessController < ApplicationController
	
  def index
  	#display text&links
  end

  def login
  	#login form 
  end

 def attempt_login
 	if params[:name].present? && params[:password].present?
 		found_user = User.where(:name => params[:name]).first
 		if found_user
 			authorized_user = found_user.authenticate(params[:password])
 		end
 	end
 	if authorized_user
 		#TODO
 		flash[:notice]= "you are now logged in."
 		redirect_to pdfs_path
 	else
 		flash[:notice] = "Invalid username/password combination."
 		redirect_to(:action => 'login')
 	end

  
 end

 def logout
 	#TODO 
 	flash[:notice]= " logged out."
 		redirect_to(:action => 'login')
 end
end
