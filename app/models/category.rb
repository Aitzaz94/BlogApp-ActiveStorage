class Category < ApplicationRecord

    validates :name, presence: true, length: {minimum: 3, maximum: 50}

    validates_uniqueness_of :name

    has_many :blog_categories
    has_many :blogs, through: :blog_categories

end