class Answer < ApplicationRecord
  include Commentable
  include Authorship

  belongs_to :question
  belongs_to :user

  validates :body, presence: true, length: { minimum: 5 }

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
