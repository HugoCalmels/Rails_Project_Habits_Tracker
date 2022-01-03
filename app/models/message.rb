class Message < ApplicationRecord
  validates :name, length: { in: 3..20 }
  validates :content, length: { in: 10..500 }
end
