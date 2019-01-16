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
          session[:error] = "Oops, Something went wrong!"
          redirect to '/oops'
      end
  end

  get '/oops' do
    erb :oops
  end

  get '/join' do
      erb :join
  end

  post '/join' do
      @user = User.new(username: params[:username], name: params[:name],email: params[:email], password: params[:password])
      if @user.save
        redirect '/account'
      else
          session[:error] = "Oops, Something went wrong. Please make sure to fill in all the fields."
          redirect '/join'
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
