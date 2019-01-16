require './config/environment'
require './app/helpers/helper_methods'

class ImagesController < ApplicationController
  include HelperMethods

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_style"
  end

  	get '/account' do
    		if logged_in?
    			@user = current_user
    			erb :mystyle
    		else
    			erb :index
    		end
    	end

    	post '/mystyle' do
    		@image = Image.new(style: params["_style"], brand: params["brand"])
    		@image.user = current_user
        if params[:file]
          filename = params[:file][:filename]
          file = params[:file][:tempfile]
          File.open("./public/images/#{filename}", 'wb') do |f|
            f.write(file.read)
          end
          @image.picture = filename
        end
    	end
        end
