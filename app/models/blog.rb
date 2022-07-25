class Blog < ApplicationRecord

  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :user_id, presence: true

  has_many :blog_categories
  has_many :categories, through: :blog_categories
  has_many :comments, dependent: :destroy
  belongs_to :user

  mount_uploader :image, FileUploader

  has_many :images, as: :picturable

  has_many :search_opmtimizations

end
