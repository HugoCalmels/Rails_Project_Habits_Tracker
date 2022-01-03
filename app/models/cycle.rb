class Cycle < ApplicationRecord
  has_many :good_habits, dependent: :destroy
  has_many :users, through: :good_habits, dependent: :destroy
  has_many :bad_habits, dependent: :destroy
  has_many :users, through: :bad_habits, dependent: :destroy
end
