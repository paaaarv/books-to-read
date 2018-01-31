require './config/environment'
require 'pry'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  use Rack::Flash
   configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end



  helpers do

    def logged_in?
      if session[:user_id]
        return self
      else
        return false
      end
    end

    def current_user
      @user = User.find(session[:user_id])
      return @user
    end
  end
end
