class TasksController < ApplicationController
  layout 'application'

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @priorities = Priority.all
  end

  def create
    @task = Task.new(task_params)
    @task.priority = Priority.find(params[:task][:priority])
    if @task.save
      flash[:notice] = "Item succesfully saved."
      redirect_to tasks_path
    else
      flash[:notice] = "Item not saved."
      redirect_to new_task_path
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def task_params
    params.require(:task).permit(:todo, :memo, :due_date)
  end
end
