require 'bcrypt'
class User < ApplicationRecord
    # require "securerandom"
    include BCrypt
    has_secure_password

    validates :name, presence: true
    validates :email,presence: true
    validates :password,presence: true
            # Include default devise modules.
        #     devise :database_authenticatable, :registerable,
        #             :recoverable, :rememberable, :trackable, :validatable,
        #             :confirmable, :omniauthable
            # include DeviseTokenAuth::Concerns::User
  has_many :posts, dependent: :destroy
  has_many :likes
  # Include default devise modules. Others available are:
#   :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
        #  :recoverable, :rememberable, :validatable
  
         
end
