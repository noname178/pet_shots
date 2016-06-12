class Image < ActiveRecord::Base
  belongs_to :article

  validates :name, presence: true

  mount_uploader :name, ImageUploader
end
