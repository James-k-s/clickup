class TaskCommentsController < ApplicationController

  def create
    @task = Task.find(params[:task_id]) # This will work!
    @task_comment = @task.task_comments.new(task_comment_params)
      @task_comment.user_id = current_user.id


    if @task_comment.save
      redirect_to tasks_path, notice: "Comment added!"
    else
      redirect_to tasks_path, alert: "Comment could not be added."
    end

  end

  private

  def task_comment_params
    params.require(:task_comment).permit(:comment)

  end
end
