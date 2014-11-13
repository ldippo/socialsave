class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :bookmarks
  has_many :favorites
  def set_default_role
    self.role ||= :user
  end
  def favorited(bookmark)
     favorites.where(bookmark_id: bookmark.id).first
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :omniauthable, :omniauth_providers => [:facebook]
end
