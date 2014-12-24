class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    '/staffs/new'   # new_staff_path
  end

end


