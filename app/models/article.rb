class Article < ActiveRecord::Base
  has_one :image
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true

  acts_as_taggable

  accepts_nested_attributes_for :image
end
