class About < ApplicationRecord
  has_many :about_list_texts
  has_one_attached :image

  def image_medium
    image.variant(resize: "400x400!").processed
  end
end
