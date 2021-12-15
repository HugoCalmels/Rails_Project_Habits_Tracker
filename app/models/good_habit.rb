class GoodHabit < ApplicationRecord
  before_save :default_values
  belongs_to :user
  belongs_to :cycle
  has_many :checkpoints, dependent: :destroy

  def default_values
    self.successed_checkpoints = 0
  end
end
