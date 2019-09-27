class ApplicationController < ActionController::Base
	#deviseの記入欄の追加には、ここでパラメーター追加
	before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   if resource.class == Admin
  #     admins_users_path
  #   elsif resource.class == User
  #     root_path
  #   end
  # end

  # def after_sign_out_path_for(resource)
  #   if resource == :admin
  #     new_admins_admin_session_path
  #   elsif resource == :user
  #     root_path
  #   end
  # end

    def after_sign_in_path_for(resource)
    if resource.class == Admin
      admins_users_path
    elsif resource.class == User
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    #logger.debug(resource_or_scope)
    #logger(動いているログ),debugは中身をコンソールに反映させる
    if resource_or_scope == :admins_admin
      new_admins_admin_session_path
    else
      root_path
    end
  end


	protected
	 def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone_number])
	 end

	ENV['SECRET_KEY']
end
