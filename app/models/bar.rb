class Bar < ActiveRecord::Base
  validates :title, :body, :authors, :entry_url, :description, :published_at, presence: true
  validates :title, uniqueness: true
  validates :entry_url, uniqueness: true
end
