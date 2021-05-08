class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tip

  validates :comment, presence: true
end
