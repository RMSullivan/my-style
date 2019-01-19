require './config/environment'
require './app/helpers/helper_methods'

class ApplicationController < Sinatra::Base
  include HelperMethods

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_style"
  end

    get '/' do
       if logged_in?
  		    redirect '/account'
  	    else
  		    erb :index
        end
    end

    post '/' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/account'
        else
            session[:error] = "Oops, Something went wrong"
        end
    end


    get '/logout' do
            if logged_in?
                session.clear
                redirect '/'
            else
                redirect '/join'
            end
    end



  get '/test' do
  template = "The current minutes are <%= Time.now.min%>."
  erb template
end
end
