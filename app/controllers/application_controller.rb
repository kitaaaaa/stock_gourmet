class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def map
		results = Geocoder.search(params[:address])
		@latlng = results.first.coordinates
		# これでmap.js.erbで、経度緯度情報が入った@latlngを使える
  		# respond_to以下の記述によって、
  		# remote: trueのアクセスに対して、
	 	# map.js.erbが変えるようになります。
  		respond_to do |format|
    		format.js
		end
	end

	protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
	end
end
