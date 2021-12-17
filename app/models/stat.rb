class Stat < ApplicationRecord
  before_create :default_values
  belongs_to :good_habit, optional: true
  belongs_to :bad_habit, optional: true


  def default_values
    self.total_result_failed = 0
    self.total_result_success = 0
  end
end
