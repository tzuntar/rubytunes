class Song < ApplicationRecord
  validates_presence_of :title
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :comments
  belongs_to :album, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
