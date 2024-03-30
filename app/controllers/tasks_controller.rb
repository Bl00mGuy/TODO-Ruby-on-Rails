class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # Другие методы: show, edit, update, destroy

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
