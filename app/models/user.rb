class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  belongs_to :course

  DEFAULT_USER_FIELDS = [
    :username,
    :first_name,
    :last_name,
    :mobile_phone,
    :email,
    :course_id
    ]
end
