module HelperMethods
	def logged_in?
  		!!session[:username]
  	end

  	def current_user
  		user = User.find(session[:username])
  	end
end
