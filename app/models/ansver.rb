class Ansver < ApplicationRecord
  belongs_to :question

  validates :body, presence:  true, length: { minimum: 1 }

end