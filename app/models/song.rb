class Song < ApplicationRecord
  validates_presence_of :title
  has_many :artists
  belongs_to :album, :user, dependent: :destroy
end
