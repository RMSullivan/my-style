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

    	post '/account' do
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

    		if @image.save
    			redirect "/account/#{@image.id}"
    		else
    			redirect "/account/new"
    		end
    	end

    	get '/account/:id/edit' do
    		if logged_in?
    			@image = Image.find_by(id: params[:id])
    			erb :'account/edit'
    		else
    			redirect '/'
    		end
    	end

    	post '/account/:id' do
    		@image = Image.find_by(id: params[:id])
    		@image.update(style: params["_style"], brand: params["brand"])
    		if params[:file]
          filename = params[:file][:filename]
          file = params[:file][:tempfile]
          File.open("./public/images/#{filename}", 'wb') do |f|
            f.write(file.read)
          end
          @image.picture = filename
        end
        if @image.save
    			redirect "/account/#{params[:id]}"
    		else
    			redirect "/account/#{params[:id]}/edit"
    		end
    	end

    	get '/account/:id' do
    		if logged_in?
    			@image = Image.find_by(id: params[:id])
    			@user = current_user
    			erb :'account/show'
    		else
    			redirect '/'
    		end
    	end

      delete '/account/:id/delete' do
        @image = Image.find_by(id: params[:id])
        if logged_in? && @image.user == current_user
          @image.destroy
          session[:message] = "You successfully deleted your image"
          redirect '/account'
        else
          redirect '/account/#{@image.id}'
        end
      end
end
