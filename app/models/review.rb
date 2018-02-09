class Review < ApplicationRecord
  belongs_to :professor
  belongs_to :offer
  belongs_to :user
end
