require 'pry'

class UsersController < ApplicationController

  get '/login' do
    if logged_in?
      redirect '/books'
    else
      erb :'/users/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect "/books"
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
    @user = User.create(username: params["username"], password: params["password"])
    session[:user_id] = @user.id
    current_user
    redirect "/books"
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    if @user && @user.authenticate(params["password"])
      session[:user_id] = @user.id
      redirect '/books'
    else
      redirect '/login'
    end
  end


  get '/logout' do
    if logged_in?
      session.clear
    else
      redirect '/login'
    end 
  end



end
