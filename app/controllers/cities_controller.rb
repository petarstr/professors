class CitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: City.all
  end
end
