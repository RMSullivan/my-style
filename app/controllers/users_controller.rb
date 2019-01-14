class UsersController < ApplicationController

  get "/account" do
    #@images = Images.user.all
    erb :account
  end

  post "/account" do
    #@images = Images.user.all
    erb :account
  end

end
