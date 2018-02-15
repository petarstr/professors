class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  belongs_to :course, optional: true

  DEFAULT_USER_FIELDS = [
    :username,
    :first_name,
    :last_name,
    :mobile_phone,
    :email,
    :course_id
    ]
end
