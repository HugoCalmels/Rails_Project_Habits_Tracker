class GoodHabit < ApplicationRecord
  belongs_to :user
  belongs_to :cycle
end
