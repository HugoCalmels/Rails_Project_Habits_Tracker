class GoodHabit < ApplicationRecord

  belongs_to :user
  belongs_to :cycle
  has_many :stats, dependent: :destroy
  has_many :checkpoints, dependent: :destroy


end
