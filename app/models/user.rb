class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :words

  # validate
  validates :name, presence: true, length: { in: 1..50 }
  validates :email,
            presence: true,
            length: { in: 1..255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true

  # using carrierwave
  mount_uploader :icon, ImageUploader

end
