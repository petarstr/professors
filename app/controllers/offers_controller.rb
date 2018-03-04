class OffersController < ApplicationController
  before_action :authenticate_professor!, only: [:create, :edit, :update, :destroy]

  def index
    offers = Offer.where(professor_id: params[:professor_id]).as_json(include: [
      :professor,
      :prices,
      subjects: { include: { course: { include: [:faculty] }}}
      ])
    render json: offers
  end

  def create
    body = JSON.parse(request.body.read)

    OffersService.instance.create_offer(current_professor.id, body)
    204
  end

  def show
    prof_id = params[:professor_id]
    offer_id = params[:id]

    render json: Offer.find_by(professor_id: prof_id, id: offer_id).as_json(include: Offer::ASSOCIATED_OFFER_OBJECTS)
  end

  def edit
    offer = Offer.find_by(professor_id: current_professor.id, id: params[:offer_id]).as_json(include: [
      :professor,
      :prices,
      subjects: { include: { course: { include: [:faculty] }}}
      ])
    render json: offer
  end

  def update
    prof_id = params[:professor_id]
    offer_id = params[:id]
    body = JSON.parse(request.body.read)

    OffersService.instance.update_offer(prof_id, offer_id, body)
  end

  def destroy
    offer = Offer.find_by(professor_id: current_professor.id, id: params[:offer_id])
    raise ActiveRecord::RecordNotFound unless offer

    offer.destroy
    204
  end

  def search
    subject_id = params[:subject_id]
    result = Offer.joins(:subjects).where('subjects.id = ?', subject_id).as_json(include: [
      :professor,
      :prices,
      subjects: { include: { course: { include: [:faculty] }}}
    ])

    render json: result
  end
end
