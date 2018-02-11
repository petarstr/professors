class ProfessorsController < ApplicationController
  before_action :authenticate_professor!

  def edit
    render json: Professor.select(Professor::DEFAULT_PROFESSOR_FIELDS).find(params[:id])
  end

  def update
    body = JSON.parse(request.body.read)
    ProfessorsService.instance.edit_profile(params[:id], body)
    204
  end
end
