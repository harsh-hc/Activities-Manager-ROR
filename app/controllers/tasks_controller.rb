class TasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    # @tasks = Task.all
    @tasks = current_user.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end 

  def complete
    @task = current_user.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to tasks_path
    # render index
   end
   

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end


  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task =Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_task
    #   @task = Task.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :completed, :user_id)
      
      # params.fetch(:task, {})
    end
end
