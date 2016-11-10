class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :title, presence:  true, length: { maximum: 255 }
  validates :body,  presence:  true
end