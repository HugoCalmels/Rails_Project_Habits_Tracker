class Calendar < ApplicationRecord
  belongs_to :good_habit, optional: true
  belongs_to :bad_habit, optional: true
  has_many :stats, dependent: :destroy
end
