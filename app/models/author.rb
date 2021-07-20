class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_one :author_profile, dependent: :destroy
  accepts_nested_attributes_for :author_profile

  def author_profile
    super || build_author_profile
  end
end
