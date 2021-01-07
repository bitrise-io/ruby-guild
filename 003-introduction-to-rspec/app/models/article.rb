class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  # def invalid_on?(attribute)
  #   self.invalid? && self.errors.has_key?(attribute)
  # end
end
