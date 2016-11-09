class Question < ApplicationRecord
  has_many :ansvers

  validates :title, presence:  true, length: { minimum: 1, maximum: 255 }
  validates :body,  presence:  true
end