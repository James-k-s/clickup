class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
      @user_name = current_user.first_name
    else
      @user_name = ""
    end
    @taskcomments = TaskComment.all
    @task = Task.new
    @tasks = Task.order(created_at: :desc)
  end
end
