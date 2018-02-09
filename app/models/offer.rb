class Offer < ApplicationRecord
  belongs_to :professor
  has_many :reviews
  has_and_belongs_to_many :subjects
  has_many :prices, dependent: :destroy
end
