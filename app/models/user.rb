class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rocks
  has_many :requests

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def name
    "#{first_name} #{last_name}"
  end

end
