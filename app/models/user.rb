class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :articles
  has_many :comments
  has_many :likes
  has_many :pets

  accepts_nested_attributes_for :pets

  validates :nickname, uniqueness: true, presence: true

  mount_uploader :avatar, AvatarUploader

  def not_liked?(article)
    likes.where(article_id: article.id).blank?
  end

  def liked(article)
    likes.find_by(article_id: article.id)
  end

  def is_?(current_user)
    id == current_user.id
  end
end
