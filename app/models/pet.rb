class Pet < ActiveRecord::Base
  belongs_to :user

  mount_uploader :thumbnail, ThumbnailUploader
end
