class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
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
end
