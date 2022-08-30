class User < ApplicationRecord
  attr_accessor :current_password
  
  validates :family_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }

  has_many :teams, foreign_key: :owner_id, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :teams, through: :assigns, source: :team, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  mount_uploader :icon, UsersIconUploader

  def make_nickname
    self.nickname = choose_nickname_randomly
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.first_name = "一般"
      user.family_name = "ゲスト"
      user.nickname = user.make_nickname
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.first_name = "管理"
      user.family_name = "ゲスト"
      user.nickname = user.make_nickname
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end

  private

  def choose_nickname_randomly
    chosen = Nickname.offset(rand(Nickname.count)).first
    if chosen.category == "prefix"
      chosen.content + self.family_name
    elsif chosen.category == "suffix"
      self.first_name + chosen.content
    else
      chosen.content
    end
  end
end
