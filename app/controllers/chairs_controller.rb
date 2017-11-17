class ChairsController < ApplicationController
  # skip_before_action :authenticate_request
  # def index
  #   if chair_list = Chair.all
  #       render json: { json: chair_list }, status: :ok
  #   else
  #       render json: {}, status: :not_found
  #   end
  # end
  # def new
  # end
  # def create
  #   create_chair = Chair.create(name_type: params[:name_type], table_id: params[:id])
  #   byebug
  #   if create_chair
  #     render json: { json: create_chair  }, status: :ok
  #   else
  #     render json: {}, status: :bad_request
  #   end
  # end
  # def update
  # end
  # def destroy
  # end
end
