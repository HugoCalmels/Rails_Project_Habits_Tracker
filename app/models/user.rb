class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :good_habits
  has_many :users, through: :good_habits
  has_many :bad_habits
  has_many :users, through: :bad_habits
end
