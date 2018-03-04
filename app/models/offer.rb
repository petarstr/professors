class Offer < ApplicationRecord
  belongs_to :professor
  has_many :reviews
  has_and_belongs_to_many :subjects
  has_many :prices, -> { order(:price => :asc) }, dependent: :destroy

  ASSOCIATED_OFFER_OBJECTS = [:subjects, :prices]
end
