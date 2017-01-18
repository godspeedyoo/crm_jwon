class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)

    if task.save
      flash[:notice] = 'Successfully created a task.'
      redirect_to tasks_path
    else
      flash[:warning] = "Failed to create task: #{task.errors.full_messages}"
      redirect_to new_task_path
    end
  end

  def edit
    task
  end

  def update
    if task.update(task_params)
      flash[:notice] = 'Successfully updated a task.'
      redirect_to tasks_path
    else
      flash[:warning] = "Failed to update task: #{task.errors.full_messages}"
    end

  end

  def destroy
    task.destroy

    redirect_to tasks_path
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :name,
      :due_at,
      :completed_at
    )
  end
end
