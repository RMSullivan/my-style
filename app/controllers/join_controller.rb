require './config/environment'
require './app/helpers/helper_methods'

class JoinController < ApplicationController
  include HelperMethods

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_style"
  end
  get '/join' do
    erb :join
  end


end
