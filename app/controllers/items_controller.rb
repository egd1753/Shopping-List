class ItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    item = @list.items.new(item_params)

    if item.save
      flash[:notice] = "Item saved successfully"
      redirect_to [@list]
    else
      flash[:alert] = "Item failed to save"
      redirect_to [@list]
    end
  end


#  def update
#    @list = List.find(params[:list_id])
#    item = @list.items.find(params[:id])
#    item.body = params[:item][:body]
#    item.save!

#    if item.save
#      flash[:notice] = "Item successfully updated"
#      redirect_to [@list]
#    else
#      flash[:alert] = "There was an error updating. Try again"
#      redirect_to [@list]
#    end
#  end


  def destroy
    @list = List.find(params[:list_id])
    item = @list.items.find(params[:id])

    if item.destroy
      flash[:notice] = "Your item was successfully swallowed by a black hole"
      redirect_to [@list]
    else
      flash[:alert] = "Your item got stuck in a quantuum flux. Try again"
      redirect_to [@list]
    end
  end


  private
  def item_params
    params.require(:item).permit(:body)
  end

end
