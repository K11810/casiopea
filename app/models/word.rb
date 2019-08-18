class Word < ApplicationRecord

  # association
  belongs_to :user

  # validate
  validates :title, presence: true, length: { in: 1..20 }
  validates :word, presence: true, length: { in: 1..500 }
  validates :source, length: { maximum: 500 }
  validates :comment, length: { maximum: 10000 }

  # using carrierwave
  mount_uploader :picture, ImageUploader

end
