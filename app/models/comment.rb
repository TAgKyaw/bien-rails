class Comment < ApplicationRecord
  belongs_to :review

  profanity_filter :body, :method => 'stars'
  validates :body, presence: true
end
