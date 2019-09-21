class ApplicationController < ActionController::Base
	#deviseの記入欄の追加には、ここでパラメーター追加
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone_number])
	end

	ENV['SECRET_KEY']
end
