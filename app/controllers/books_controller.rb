require 'pry'
class BooksController < ApplicationController

  get '/books' do
    if logged_in?
      @books = Book.all
      @user = current_user
      erb :'/books/index'
    else
      flash[:message] = "Please Log in."
      redirect '/login'
    end
  end

  get '/books/new' do

    if logged_in?
      @genres = Genre.user_genres(current_user)
      erb :'/books/new'
    else
      flash[:message] = "Please Log in."
      redirect '/login'
    end
  end

  post '/books/new' do
    if params["name"] == "" || params["author"] == ""
      flash[:notice] = "Please fill out both Book Title & Author Name."
      redirect "/books/new"
    else
      @book = Book.create(name: params["name"], author: params["author"], notes: params["notes"], genre_ids: params["genre_ids"])
      @book.user_id = current_user.id
      if !params["genres"]["name"].empty?
        genre = Genre.new(name: params["genres"]["name"])
        @book.genres << genre
      end
      @book.save
      redirect "/books/#{@book.id}"
    end
  end

  get "/books/:id" do
    if logged_in?
      @user = current_user
      @book = Book.find(params[:id])
      erb :"/books/show"
    else
      flash[:message] = "Please Log in."
      redirect '/login'
    end
  end

  get "/books/:id/edit" do
    if logged_in?
      @user = current_user
      @book = Book.find(params[:id])
      @genres = Genre.user_genres(current_user)
      erb :"/books/edit"
    else
      flash[:message] = "Please Log in."
      redirect '/login'
    end
  end

  patch "/books/:id" do
    @book = Book.find(params[:id])
    @book.update(name: params['name'], author: params["author"], notes: params["notes"], genre_ids: params["genre_ids"])
    @book.user_id = current_user.id
    if !params["genres"]["name"].empty?
      @book.genres << Genre.new(name: params["genres"]["name"])
    end
    @book.save
    redirect "/books/#{@book.id}"
  end

  get '/books/:id/delete' do
    @book = Book.find(params[:id])
    @book.delete
    redirect '/books'
  end
end
