class BooksController < ApplicationController

  def top
  end

  def index
  	@books = Book.all
    @book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  	  flash[:success] = "Book was successfully created."
  	  @books = Book.all
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "Error"
      @books = Book.all
      render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully update."
      render 'show'
    else
      flash.now[:notice] = "update error"
      render 'show'
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  	flash[:success] = " Book was successfully destroyed."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end