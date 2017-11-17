class TablesController < ApplicationController
  def index
    table_list = Table.all
    render json: table_list 
  end

  def new

  end


  def create
    if params[:table_name][:name]
      create_table = Table.create!(name: params[:table_name][:name])
      render json: create_table, status: :created
    else
      render status: :bad_request
    end

  end

  def update
    update_table = Table.find(params[:id])
    
    if update_table.nil?
      render status: :not_found
    else
      render update_table, status: :ok
    end

  end

  def destroy
    delete_table = Table.find(params[:id])
    if delete_table.nil?

      render status: :not_found
    else
      delete_table.destroy
      render json: delete_table, status: :ok
      
    end
  end

  def show
    show_table = Table.find(params[:id])
    
    if show_table.nil?
      render status: :not_found
    else
      render json: show_table, status: :found
    end
  end
end
