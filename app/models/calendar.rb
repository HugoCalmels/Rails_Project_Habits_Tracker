class Calendar < ApplicationRecord
  belongs_to :good_habit, optional: true
  has_many :stats, dependent: :destroy
end
