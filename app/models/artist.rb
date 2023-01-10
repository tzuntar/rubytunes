class Artist < ApplicationRecord
  validates_presence_of :name
  has_many :albums, dependent: :destroy
end
