class Cycle < ApplicationRecord
  has_many :habits
  has_many :users, through: :habits
end
