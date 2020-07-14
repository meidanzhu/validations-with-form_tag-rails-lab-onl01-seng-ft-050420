class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {min: 100}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
