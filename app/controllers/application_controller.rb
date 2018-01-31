require './config/environment'

class ApplicationController < Sinatra::Base
   configure do
    set :public_folder, 'public'
    set :views, 'app/views'
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
