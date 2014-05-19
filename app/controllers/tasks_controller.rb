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
    @priorities = Priority.all
    @task.priority = Priority.find(params[:task][:priority_id])
    if @task.valid?
      if(params[:confirm])
        @task.save! rescue render :new
        render "completion"
      else
        render "confirm"
      end
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    @priorities = Priority.all
  end

  def update
    @task = Task.find(params[:id])
    @priorities = Priority.all
    @task.assign_attributes(params.require(:task).permit(:todo, :due_date, :priority_id, :memo))
    if @task.valid?
      if(params[:confirm])
        @task.save! rescue render :edit
        render "completion"
      else
        render "confirm"
      end
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    begin
      @task.destroy
      flash[:success] = "Task was destroyed." 
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:todo, :memo, :due_date)
  end
end
