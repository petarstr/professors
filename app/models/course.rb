class Course < ApplicationRecord
  belongs_to :faculty
  has_many :subjects
  has_many :users
end
