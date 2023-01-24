class Album < ApplicationRecord
  validates_presence_of :title
  has_many :songs, dependent: :destroy
  has_and_belongs_to_many :artists, dependent: :destroy
  has_one_attached :album_art
end
