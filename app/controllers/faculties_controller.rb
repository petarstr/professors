class FacultiesController < ApplicationController
  def index
    city_id = params[:id]
    render json: Faculty.where(city_id: city_id)
  end
end
