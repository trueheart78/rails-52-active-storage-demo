class Post < ApplicationRecord
  has_one_attached :image
  has_one_attached :second_image

  before_destroy :purge_images, prepend: true

  private

  def purge_images
    image.purge if image.attached?
    second_image.purge if second_image.attached?
  end
end
