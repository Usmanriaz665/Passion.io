modual Api
 module V1
class VerticalsController < ApplicationController
  before_action :check_params_validity, except: [:index, :destroy]

  def index
    verticals = Vertical.all.paginate_records(params[:cursor], params[:size])
    render json: {status: "success", message: "Records fetched successfully", verticals: verticals}
  end

  def create
    begin
      vertical = Vertical.create! vertical_params
      render json: {status: "success", message: "Vertical created successfully", id: vertical.id}
    rescue
      render json: {status: "failed", message: "Unable to create vertical"}
    end
  end

  def show
    begin
      get_vertical
      render json: {status: "success", message: "Vertical created successfully", vertical: @vertical}
    rescue
      render json: {status: "failed", message: "Unable to fetch vertical"}
    end
  end

  def update
    begin
      get_vertical
      @vertical.update!(vertical_params)
      render json: {status: "success", message: "Vertical updated successfully", id: @vertical.id}
    rescue
      render json: {status: "failed", message: "Unable to update vertical"}
    end
  end

  def destroy
    begin
      get_vertical
      @vertical.destroy!
      render json: {status: "success", message: "Vertical deleted successfully", id: @vertical.id}
    rescue
      render json: {status: "failed", message: "Unable to delete vertical"}
    end
  end

  private
  def check_params_validity
    if action_name == "create" || action_name == "update"
      render json: {status: "failed", message: "please send valid parameters"} unless params[:vertical].present?
    end
  end

  def vertical_params
    params.require(:vertical).permit(:name)
  end

  def get_vertical
    @vertical = Vertical.find params[:id]
  end
end
end
end
