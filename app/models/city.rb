class City < ApplicationRecord
  has_many :faculties
  has_many :professors
end
