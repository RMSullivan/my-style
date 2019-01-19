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

    post '/join' do
        @user = User.new(username: params[:username], name: params[:name],
          email: params[:email], password: params[:password])
        if @user.save
  		    redirect '/account'
        else
            session[:error] = "Oops, Something went wrong. Please make sure to fill in all the fields."
            redirect '/join'
        end
    end


end
