class ProfessorsController < ApplicationController
  before_action :authenticate_professor!

  def edit
    render json: Professor.select(Professor::DEFAULT_PROFESSOR_FIELDS).find(current_professor.id)
  end

  def update
    ProfessorsService.instance.edit_profile(current_professor.id, params)
    204
  end
end
