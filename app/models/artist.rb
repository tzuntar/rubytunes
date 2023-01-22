class Artist < ApplicationRecord
  validates_presence_of :name
  has_and_belongs_to_many :albums, dependent: :destroy
  has_and_belongs_to_many :songs, dependent: :destroy
  has_one_attached :artist_photo
end
