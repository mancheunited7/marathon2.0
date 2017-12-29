class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:userid] = User.create_unique_string
    super
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_confirmation_path
  end
end
