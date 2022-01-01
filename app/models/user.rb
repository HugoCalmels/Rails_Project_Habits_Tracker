class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :default_values
         
  has_many :good_habits
  has_many :users, through: :good_habits
  has_many :bad_habits
  has_many :users, through: :bad_habits

  def default_values
    self.state = 'active'
  end
end
