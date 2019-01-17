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
    @images = Image.all
    erb :index
  end

  get '/' do
    erb :index
  end


  get '/test' do
  template = "The current minutes are <%= Time.now.min%>."
  erb template
end
end
