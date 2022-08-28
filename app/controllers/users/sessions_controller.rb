class Users::SessionsController < Devise::SessionsController
  before_action :login_user_cannot, only: :new

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user.id)
  end

  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to user_path(user.id)
  end

  def login_user_cannot
    redirect_to teams_path if user_signed_in?
  end
end
