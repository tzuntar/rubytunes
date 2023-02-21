class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :songs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_pic

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
    end
  end

  def profile_pic_thumbnail
    if profile_pic.attached?
      #profile_pic.variant(resize: '150x150!').processed
      profile_pic
    elsif avatar_url.present?
      avatar_url
    else
      'icons/avatar.svg'
    end
  end

end
