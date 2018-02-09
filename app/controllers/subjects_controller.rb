class SubjectsController < ApplicationController
  def index
    course_id = params[:id]
    render json: Subject.where(course_id: course_id)
  end
end
