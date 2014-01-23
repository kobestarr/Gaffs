class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#the application controller deals with all of our other
#contollers like a boss

#lets make a shortcut called current user

def current_user
	if session[:user_id].present?
		User.find(session[:user_id])	
	end
end	

#make the shortcut
helper_method :current_user

end
