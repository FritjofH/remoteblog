class About < ApplicationRecord
  has_many :about_list_texts
  has_one_attached :image, dependent: :delete
  has_one :external_url
  has_rich_text :body
  has_rich_text :description

  def image_medium
    image.variant(resize: "400x400!").processed
  end

  def image_large
    image.variant(resize: "600x600!").processed
  end
end
