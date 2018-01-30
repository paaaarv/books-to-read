class UsersController < ApplicationController

  get '/login' do
  end

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do
    @user = User.create(username: params["username"], password: params["password"])
    redirect "/books"
  end

  get '/logout' do
  end

end
