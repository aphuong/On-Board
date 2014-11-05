class TodosController < ApplicationController

  before_action :set_todo, only: [:edit, :update, :destroy]

  def new 
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todos_params)
    if @todo.save
      flash[:notice] = "A list item was successfully created."
      redirect_to admins_dashboard_path
    else
      flash[:alert] = "We encountered a problem. Please try again."
      render "admins#index"
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @todo.update(todos_params)
        format.html { redirect_to edit_todo_path(@todo), :notice => "Todo was successfully updated." }
        format.json { respond_with_bip(@todo) }
      else
        render "admins/dashboard", alert: "Sorry - something went wrong."
      end
    end
  end

  def destroy
    @todo.destroy
    redirect_to admins_dashboard_path
  end

  def checked 
    if UserTodo.create(todo_id: params[:id], user_id: current_user.id)
      render json: @todo
    end
  end

  def unchecked
    @todo = UserTodo.where(user_id: current_user.id, todo_id: params[:id])
    if @todo
      @todo.destroy_all
      render json: @todo
    end
  end

  private

    def todos_params
      params.require(:todo).permit(:body, :id)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end

end
