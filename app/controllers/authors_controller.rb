class AuthorsController < ApplicationController
  def show
    set_author
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
    if @author.valid?
       @author.save
       redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    set_author
  end

  def update
    set_author
    if @author.valid?
      @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
