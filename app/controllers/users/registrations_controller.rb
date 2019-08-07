# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    respond_with resource
  end

  def create
    resource = User.new(sign_up_params)
    if resource.save
      flash[:notice] = t(:success_create)
      flash.keep(:notice)
      render js: "window.location = '/users/sign_in'"
    else
      flash.now[:error] = resource.errors.full_messages.first
      respond_to do |format|
        format.js
      end
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
