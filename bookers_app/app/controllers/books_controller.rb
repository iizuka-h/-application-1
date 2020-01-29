class BooksController < ApplicationController
  # GET /books
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    @books = Book.all
    @book = Book.new
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
  end

  # GET /books/1/edit
  def edit
      
end

  # POST /books
  def create
    @book = Book.new(book_params)
      if @book.save
        redirect_to book_path(@book.id)
        flash[:notice] = "successfully"
      else
        # flash[:error] = book.errors.full_messages
        # redirect_to books_path
        @books = Book.all

        render :index

    end
  end


  # PATCH/PUT /books/1
  def update
    
      if @book.update(book_params)
        redirect_to book_path(@book.id)
        flash[:notice] = "successfully"
      else
        render :edit
      
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
