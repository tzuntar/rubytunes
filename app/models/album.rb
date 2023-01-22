class Album < ApplicationRecord
  validates_presence_of :title
  has_and_belongs_to_many :songs, dependent: :destroy
  has_and_belongs_to_many :artists, dependent: :destroy
end
