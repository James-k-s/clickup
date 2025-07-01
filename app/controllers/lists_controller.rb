class ListsController < ApplicationController
  def index
    if current_user
      @user_name = current_user.first_name
      @lists = current_user.lists.all.order(created_at: :desc)
      @list = List.new
    else
      redirect_to new_user_session_path, alert: "You need to sign in first."
    end
  end

  def new
    @list = List.new

  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to lists_path, notice: "List created successfully."
    else
      flash.now[:alert] = "Error creating list. Please try again."
      render :new
    end
  end


  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path, notice: "List updated successfully."
    else
      flash.now[:alert] = "Error updating list. Please try again."
      render :edit
    end
  end


  private

  def list_params
    params.require(:list).permit(:name, :category, :status)
  end
end
