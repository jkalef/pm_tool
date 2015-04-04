class RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path(user)
		new_project_path
	end

end
