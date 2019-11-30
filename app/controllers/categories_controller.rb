class CategoriesController < ApplicationController
  before_action :check_params_validity, except: [:index, :destroy]
  before_action :get_vertical

  def index
    categories = @vertical.categories.paginate_records(params[:cursor], params[:size])
    render json: {status: "success", message: "Records fetched successfully", categories: categories}
  end

  def create
    begin
      category = @vertical.categories.create! category_params
      render json: {status: "success", message: "Category created successfully", id: category.id}
    rescue
      render json: {status: "failed", message: "Unable to create category"}
    end
  end

  def show
    begin
      get_category
      render json: {status: "success", message: "Category created successfully", category: @category}
    rescue
      render json: {status: "failed", message: "Unable to fetch category"}
    end
  end

  def update
    begin
      get_category
      @category.update!(category_params)
      render json: {status: "success", message: "Category updated successfully", id: @category.id}
    rescue
      render json: {status: "failed", message: "Unable to update category"}
    end
  end

  def destroy
    begin
      get_category
      @category.destroy!
      render json: {status: "success", message: "Category deleted successfully", id: @category.id}
    rescue
      render json: {status: "failed", message: "Unable to delete category"}
    end
  end

  private
  def check_params_validity
    if action_name == "create" || action_name == "update"
      render json: {status: "failed", message: "please send valid parameters"} unless params[:category].present?
    end
  end

  def category_params
    params.require(:category).permit(:name, :state)
  end

  def get_category
    @category = @vertical.categories.find params[:id]
  end

  def get_vertical
    begin
      @vertical = Vertical.find params[:vertical_id]
    rescue
      render json: {status: "failed", message: "please send valid vertical id"} unless params[:vertical_id].present?
    end
  end
end
