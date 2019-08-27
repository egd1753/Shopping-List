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
    @list = List.find(params[:id])
  end


  def update
    @list = List.find(params[:id])
    @list.title = params[:list][:title]
    @list.body = params[:list][:body]

    if @list.save
      flash[:notice] = "List was updated"
      redirect_to @list
    else
      flash.now[:alert] = "There was an error saving list. Try again."
      render :edit
    end
  end


  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      flash[:notice] = "'#{@list.title}' was successfully deleted."
      redirect_to lists_path
    else
      flash.now[:alert] = "There was an error deleting this list."
      render :index
    end
  end

end
