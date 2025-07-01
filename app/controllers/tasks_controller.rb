class TasksController < ApplicationController


  def index
    if current_user
      @user_name = current_user.first_name
      @taskcomments = current_user.task_comments
      @task = Task.new
      @tasks = current_user.tasks.order(created_at: :desc)
    else
      @user_name = ""
      redirect_to new_user_session_path

    end
  end

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
      redirect_to tasks_path, notice: "Task created!"
    else
      redirect_to tasks_path, notice: "Unable to perform that right now!"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task updated!"
    else
      redirect_to tasks_path, alert: "Unable to update task."
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :status, :end_date, :priority, :user_id, :description)
  end
end
