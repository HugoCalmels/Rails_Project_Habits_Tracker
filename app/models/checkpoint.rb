class Checkpoint < ApplicationRecord
  before_create :default_values
  belongs_to :good_habit, optional: true
  belongs_to :bad_habit, optional: true

  def default_values
    self.checked = false
  end
end
