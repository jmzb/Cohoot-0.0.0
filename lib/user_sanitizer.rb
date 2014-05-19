class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    
	def sign_up
        default_params.permit(:first_name, :last_name, :job_title, :volunteer, :organization_id, :email, :password, :password_confirmation, :current_password)
    end

    def account_update
        default_params.permit(:first_name, :last_name, :job_title, :volunteer, :organization_id, :email, :password, :password_confirmation, :current_password)
    end

    def edit
        default_params.permit(:first_name, :last_name, :job_title, :volunteer, :organization_id, :email, :password, :password_confirmation, :current_password)
    end
end

