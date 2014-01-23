class SessionsController < ApplicationController

	# sessions are the way the browser tracks me
	# we want to manage them in our app
	# sessions controller deals with this stuff


	def destroy

		#aka logging out
		reset_session
		flash[:success] = "you've logged out"
		redirect_to root_path
		
	end

  def new
  	# log in form


  end


  def create
  	# do the log in
  	# i want to findt the username and password typed in

  	@username = params[:session][:username]
  	@password = params[:session][:password]



  	# then I want to see if there is a user with that username
  	@user = User.find_by_username(@username)


  	# if there is check their password as well
  	if @user.present? and @user.authenticate(@password)
  	
  		# if it matches, give them the session
  		session[:user_id] = @user.id
  		flash[:success] = "You're logged in"
  		redirect_to root_path  
  	else	
  		
  		flash[:error] = "Wrong username password combination"

  		# if not, show the new page
  		render "new"

  	end

  	


  end

end
