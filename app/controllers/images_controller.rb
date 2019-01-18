require './config/environment'
require './app/helpers/helper_methods'

class ImagesController < ApplicationController
  include HelperMethods

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_style"

    get '/' do
      @images = Image.all
      erb :index
    end
  end
end
