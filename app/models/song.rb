class Song < ApplicationRecord
  validates_presence_of :title
  has_and_belongs_to_many :artists
  has_many :comments
  has_one_attached :mp3
  belongs_to :album, dependent: :destroy
  belongs_to :user, dependent: :destroy
  accepts_nested_attributes_for :album
  accepts_nested_attributes_for :artists
end
