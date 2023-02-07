class Song < ApplicationRecord
  validates_presence_of :title
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :tags
  has_many :comments
  has_one_attached :mp3
  has_one :genre
  belongs_to :album, dependent: :destroy
  belongs_to :user, dependent: :destroy
  accepts_nested_attributes_for :album
  accepts_nested_attributes_for :artists
  accepts_nested_attributes_for :genre
  accepts_nested_attributes_for :tags
end
