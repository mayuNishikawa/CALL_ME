class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :icon, UsersIconUploader

  def make_nickname
    self.nickname = choose_nickname_randomly
  end

  private

  def choose_nickname_randomly
    chosen = Nickname.offset(rand(Nickname.count)).first
    if chosen.category == "prefix"
      self.family_name + chosen.content
    elsif chosen.category == "suffix"
      self.first_name + chosen.content
    else
      chosen.content
    end
  end
end
