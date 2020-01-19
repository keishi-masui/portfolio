class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, :image, :language, :comment, presence: true

end
