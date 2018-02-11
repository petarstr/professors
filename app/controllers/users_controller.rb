class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    render json: User.select(User::DEFAULT_USER_FIELDS).find(params[:id]).as_json(include: :course)
  end

  # def update
  #   body = JSON.parse(request.body.read)
  #   ProfessorsService.instance.edit_profile(params[:id], body)
  #   204
  # end
end
