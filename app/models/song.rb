class Song < ApplicationRecord
  validates_presence_of :title
  has_and_belongs_to_many :artists, dependent: :destroy
  has_and_belongs_to_many :tags, dependent: :destroy
  has_one_attached :mp3
  has_many :comments, dependent: :destroy
  belongs_to :genre
  belongs_to :album
  belongs_to :user
  accepts_nested_attributes_for :album
  accepts_nested_attributes_for :artists
  accepts_nested_attributes_for :genre
  accepts_nested_attributes_for :tags

  scope :filter_by_user, -> (user) { where user_id: user.user_id }

  include PgSearch
  pg_search_scope :kinda_spelled_like,
                  :against => :title,
                  :using => :trigram
end
