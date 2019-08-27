class ListsController < ApplicationController


  def index
    @lists = List.all
  end


  def show
    @list = List.find(params[:id])
  end


  def new
    @list = List.new
  end


  def create
    @list = List.new
    @list.title = params[:list][:title]
    @list.body = params[:list][:body]

    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash.now[:alert] = "There was an error. Try again."
      render :new
    end
  end


  def edit
  end


  def update
  end


  def delete
  end

end
