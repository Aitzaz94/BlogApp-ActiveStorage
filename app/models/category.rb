class Category < ApplicationRecord

    # validates :name, presence: true, length: {minimum: 3, maximum: 50}

    # validates_uniqueness_of :name

    validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 50}
    
    

    has_many :blog_categories
    has_many :blogs, through: :blog_categories

end