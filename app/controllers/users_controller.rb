
class UsersController < ApplicationController

  get '/' do
    erb :"/users/home"
  end
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
    if params["username"] == "" || params["password"] == ""
      flash[:message] = "Please fill in both username and password fields"
      redirect '/signup'
    else
      @user = User.create(username: params["username"], password: params["password"])
      session[:user_id] = @user.id
      current_user
      redirect "/books"
    end
  end

  post '/login' do
    if params["username"] == "" || params["password"] == ""
      flash[:message] = "Please fill in both username and password fields"
      redirect '/login'
    else
      @user = User.find_by(username: params["username"])
      if @user && @user.authenticate(params["password"])
        session[:user_id] = @user.id
        redirect '/books'
      else
        redirect '/login'
      end
    end
  end


  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/login'
    end
  end



end
