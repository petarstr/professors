class CoursesController < ApplicationController
  def index
    faculty_id = params[:id]
    render json: Course.where(faculty_id: faculty_id)
  end
end
