class Group < ApplicationRecord
  belongs_to :challenge
  belongs_to :chatroom
  has_many :user_groups
  has_many :users, through: :user_groups
  validates :duration, :exceptions, presence: true
  validates :difficulty, :inclusion => 0..10
  validates :impact, :inclusion => 0..100
  validates :completed, inclusion: [true, false]
end
