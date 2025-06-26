class TasksController < ApplicationController
  def new
    if current_user
      @task = Task.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save!
      redirect_to root_path, notice: "Task created!"
    else
      redirect_to root_path, notice: "Unable to perform that right now!"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path, notice: "Task updated!"
    else
      redirect_to root_path, alert: "Unable to update task."
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :status, :end_date, :priority, :user_id, :description)
  end
end
