# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :login_user_cannot, only: :new

  def create
    devise_create
  end

  def devise_create
    build_resource(sign_up_params)
    @user.make_nickname
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_path(@user.id)
  end

  private

  def login_user_cannot
    redirect_to teams_path if user_signed_in?
  end
end
