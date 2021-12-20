class Cycle < ApplicationRecord
  has_many :good_habits
  has_many :users, through: :good_habits
  has_many :bad_habits
  has_many :users, through: :bad_habits
end
