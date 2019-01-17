require './config/environment'
require './app/helpers/helper_methods'
class UsersController < ApplicationController

  include HelperMethods

    	configure do
      	set :views, 'app/views'
      	enable :sessions
      	set :public_folder, 'public'
      	set :session_secret, "secret_style"
      end

      get '/account' do
        erb :account
      end
    end
