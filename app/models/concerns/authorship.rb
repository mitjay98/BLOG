module Authorship
  extend ActiveSupport::Concern

  included do
    def authorized_by?(user)
      self.user == user
    end
  end
end
