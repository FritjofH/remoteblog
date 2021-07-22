class About < ApplicationRecord
  has_many :about_list_texts
  has_one_attached :image

  def image_medium
    image.variant(resize: "300x300!").processed
  end
end
