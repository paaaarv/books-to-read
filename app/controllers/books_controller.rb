class BooksController < ApplicationController


  get '/books' do
    @books = Book.all
    erb :'/books/index'
  end

  get '/books/new' do
  end

  post '/books/new' do
  end

  get "/books/:id/edit" do
  end

  get '/books/edit' do
  end

  get '/books/delete' do
  end
end
