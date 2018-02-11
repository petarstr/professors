class OffersController < ApplicationController
  def index
  end

  def create
    prof_id = params[:professor_id]
    body = JSON.parse(request.body.read)

    OffersService.instance.create_offer(prof_id, body)
    204
  end

  def show
    prof_id = params[:professor_id]
    offer_id = params[:id]

    render json: Offer.find_by(professor_id: prof_id, id: offer_id).as_json(include: Offer::ASSOCIATED_OFFER_OBJECTS)
  end

  def update
    prof_id = params[:professor_id]
    offer_id = params[:id]
    body = JSON.parse(request.body.read)

    OffersService.instance.update_offer(prof_id, offer_id, body)
  end
  def destroy
  end
end
