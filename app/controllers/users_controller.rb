require 'pry'

class UsersController < ApplicationController

  get '/login' do
  end

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do
    @user = User.create(username: params["username"], password: params["password"])
    session[:user_id] = @user.id
    current_user
    redirect "/books"
  end

  get '/logout' do
  end



end
