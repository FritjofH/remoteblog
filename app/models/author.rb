class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_one_attached :avatar

  def avatar_thumbnail
    avatar.variant(resize: "150x150!").processed
  end

  def avatar_medium
    avatar.variant(resize: "300x300!").processed
  end
end
