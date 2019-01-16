require './config/environment'
require './app/helpers/helper_methods'
class UsersController < ApplicationController

  include HelperMethods

    	configure do
      	set :views, 'app/views'
      	enable :sessions
      	set :public_folder, 'public'
      	set :session_secret, "secret_style"

        get '/account' do
		        @user = User.find_by_slug(params[:slug])
		          @current_user = current_user
		            erb :account
	             end
      end
    end
