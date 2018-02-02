
class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.user_genres(current_user)
    erb :"/genres/index"
  end

  get "/genres/:id" do
    @genre = Genre.find(params[:id])
    erb :"/genres/show"
  end
end
