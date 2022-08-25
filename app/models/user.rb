class User < ApplicationRecord
  validates :nickname, presence: true, length: { maximum: 20 }

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :icon, UsersIconUploader

  has_many :teams, foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :teams, through: :assigns, source: :team
  has_many :chats
  has_many :posts
  has_many :comments, dependent: :destroy

  def make_nickname
    self.nickname = choose_nickname_randomly
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.first_name = "一般"
      user.family_name = "ゲスト"
      user.nickname = user.make_nickname
      user.password = SecureRandom.urlsafe_base64
      user.icon = File.open("./app/assets/images/default_icon.png")
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.first_name = "管理"
      user.family_name = "ゲスト"
      user.nickname = user.make_nickname
      user.password = SecureRandom.urlsafe_base64
      user.icon = File.open("./app/assets/images/default_icon.png")
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
