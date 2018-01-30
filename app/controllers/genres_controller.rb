require 'pry'

class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :"/genres/index"
  end

  get "/genre/:id" do
    @genre = Genre.find(params[:id])
    erb :"/genres/show"
  end
end
