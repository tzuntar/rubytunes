class Song < ApplicationRecord
  validates_presence_of :title
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :tags
  has_many :comments
  has_one_attached :mp3
  belongs_to :genre, dependent: :destroy
  belongs_to :album, dependent: :destroy
  belongs_to :user, dependent: :destroy
  accepts_nested_attributes_for :album
  accepts_nested_attributes_for :artists
  accepts_nested_attributes_for :genre
  accepts_nested_attributes_for :tags

  scope :filter_by_user, -> (user) { where user_id: user.user_id }

  def self.search(query)
    return @songs = Song.all unless query
    @songs = Song.find_by_title query
  end
end
