class Faculty < ApplicationRecord
  belongs_to :city
  has_many :courses
  # has_many :subjects, through: :courses
  # has_many :users, through: :courses
end
