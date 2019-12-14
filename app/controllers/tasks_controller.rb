class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task.completed ? @msg = 'This task is completed' : @msg = 'This task is not completed yet'
  end

  def new
    @task = Task.new
  end

  def create
    Task.create!(task_params)
    redirect_to tasks_path
  end

  private

  def set
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
