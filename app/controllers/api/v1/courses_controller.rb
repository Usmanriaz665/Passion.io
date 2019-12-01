module Api
 module V1
class CoursesController < ApplicationController
  before_action :check_params_validity, except: [:index, :destroy]
  before_action :get_category

  def index
    courses = @category.courses.paginate_records(params[:cursor], params[:size])
    render json: {status: "success", message: "Records fetched successfully", courses: courses}
  end

  def create
    begin
      course = @category.courses.create! course_params
      render json: {status: "success", message: "Course created successfully", id: course.id}
    rescue
      render json: {status: "failed", message: "Unable to create course"}
    end
  end

  def show
    begin
      get_course
      render json: {status: "success", message: "Course fetched successfully", course: @course}
    rescue
      render json: {status: "failed", message: "Unable to fetch course"}
    end
  end

  def update
    begin
      get_course
      @course.update!(course_params)
      render json: {status: "success", message: "Course updated successfully", id: @course.id}
    rescue
      render json: {status: "failed", message: "Unable to update course"}
    end
  end

  def destroy
    begin
      get_course
      @course.destroy!
      render json: {status: "success", message: "Course deleted successfully", id: @course.id}
    rescue
      render json: {status: "failed", message: "Unable to delete course"}
    end
  end

  private
  def check_params_validity
    if action_name == "create" || action_name == "update"
      render json: {status: "failed", message: "please send valid parameters"} unless params[:course].present?
    end
  end

  def course_params
    params.require(:course).permit(:name, :state, :author)
  end

  def get_course
    @course = @category.courses.find params[:id]
  end

  def get_category
    begin
      @category = Category.find params[:category_id]
    rescue
      render json: {status: "failed", message: "please send valid category id"} unless params[:category_id].present?
    end
  end
end
end
end
