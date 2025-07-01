class ListItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id]) # This will work!
    @list_item = @list.list_items.new(list_items_params)

    if @list_item.save
      redirect_to lists_path, notice: "list item added!"
    else
      redirect_to lists_path, alert: "list item could not be added."
    end

  end


  private

  def list_items_params
    params.require(:list_item).permit(:description, :status)
  end
end
