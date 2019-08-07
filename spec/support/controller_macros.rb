# frozen_string_literal: true

module ControllerMacros
  def login_user
    user = create(:user)
    sign_in user
  end
end

RSpec.configure do |config|
  config.include ControllerMacros, type: :controller
  config.include ControllerMacros, type: :helper
end
