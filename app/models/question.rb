class Question < ApplicationRecord
has_many :answers, dependent: :destroy
belongs_to :user
  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
