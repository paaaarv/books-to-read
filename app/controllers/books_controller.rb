class BooksController < ApplicationController


  get '/books' do
    @books = Book.all
    erb :'/books/index'
  end

  get '/books/new' do
    erb :'/books/new'
  end

  post '/books/new' do
    if params["name"] == "" || params["author"] == ""
      redirect "/books/new"
    else
      @book = Book.create(name: params["name"], author: params["author"], notes: params["notes"])
      redirect "/books/#{@book.id}"
    end
  end

  get "/books/:id" do
    @book = Book.find(params[:id])
    erb :"/books/show"
  end

  get "/books/:id/edit" do
    @book = Book.find(params[:id])
    erb :"/books/edit"
  end

  patch "/books/:id" do
    @book = Book.find(params[:id])
    @book.update(title: params['title'], author: params["author"], notes: params["notes"])
    redirect "/books/:id"
  end

  get '/books/:id/delete' do
    @book = Book.find(params[:id])
    @book.delete
    redirect '/books'
  end
end
