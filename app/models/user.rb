class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :songs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_pic

  def profile_pic_thumbnail
    if profile_pic.attached?
      #profile_pic.variant(resize: '150x150!').processed
      profile_pic
    else
      'icons/avatar'
    end
  end
end
