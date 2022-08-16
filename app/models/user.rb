class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
  :rememberable, :validatable, :confirmable, :lockable, :timeoutable


  has_many :blogs, dependent: :destroy

  has_one_attached :image

  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

end
