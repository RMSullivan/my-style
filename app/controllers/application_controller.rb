require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_style"
  end

  get "/" do
    erb :index
  end

  post "/" do
      #@images = Images.all
      erb :index
  end


  get '/test' do
    template = "The current minutes are <%= Time.now.min%>."
  erb template
  end
end
