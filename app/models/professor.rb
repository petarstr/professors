class Professor < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  mount_uploader :image, AvatarUploader
  belongs_to :city

  DEFAULT_PROFESSOR_FIELDS = [
    :username,
    :first_name,
    :last_name,
    :email,
    :mobile_phone,
    :phone,
    :city_id,
    :faculty_id,
    :facebook,
    :street_name,
    :street_number,
    :floor,
    :apartment_number,
    :image
  ]
end
