class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def show
    @tasks = Task.find(params[:id])
  end
  def new
    @task = Task.new
  end
  def create
    @task =   Task.new(params[:task])
    @task.save
  end

  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
    redirect_to task_path(@task)
  end

  private

  def tasks_params
    params.require(task).permit(:title, :details, :completed)
  end
end
