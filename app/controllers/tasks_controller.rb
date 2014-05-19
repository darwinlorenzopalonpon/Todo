class TasksController < ApplicationController
  layout 'application'

  def index
    @tasks = Task.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
