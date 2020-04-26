class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :answers

  validates :title,:user_id,:topic_id, presence: true
end
