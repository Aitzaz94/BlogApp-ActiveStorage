class Blog < ApplicationRecord

  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :user_id, presence: true

  has_many :blog_categories, dependent: :destroy
  has_many :categories, through: :blog_categories
  has_many :comments, dependent: :destroy
  belongs_to :user

 

  has_one_attached :image

  has_many :search_opmtimizations, dependent: :destroy  

accepts_nested_attributes_for :search_opmtimizations

end
