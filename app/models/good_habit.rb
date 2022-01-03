class GoodHabit < ApplicationRecord
  has_one :calendar, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :cycle, optional: true
  has_many :stats, dependent: :destroy
  has_many :checkpoints, dependent: :destroy

  validates :title, length: { in: 3..50 }
  validates :announced_checkpoints, numericality: { greater_than_or_equal_to: 1 }
  validates :announced_checkpoints, numericality: { less_than_or_equal_to: 32 }
end
