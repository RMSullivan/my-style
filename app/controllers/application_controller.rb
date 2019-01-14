require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  post "/" do
      #@images = Images.all
      erb :index
  end

  #helpers do
	  	#!!session[:user_id]
	  	#end

	    #def current_user
	     # User.find(session[:user_id])
	   # end

  get "/join" do
    erb :join
  end

  post "/join" do
    erb :account
  end

  get "/account" do
    #@images = Images.user.all
    erb :account
  end

  post "/account" do
    #@images = Images.user.all
    erb :account
  end

  get '/test' do
    template = "The current minutes are <%= Time.now.min%>."
  erb template
  end

end
