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

  private

    def todos_params
      params.require(:todo).permit(:body)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end

end
