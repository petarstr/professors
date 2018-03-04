class ProfessorsController < ApplicationController
  before_action :authenticate_professor!

  def edit
    render json: Professor.find(current_professor.id)
  end

  def update
    ProfessorsService.instance.edit_profile(current_professor.id, params)
    204
  end

  def show
    render json: Professor.find(params[:id]).as_json(include: [:city])
  end
end
