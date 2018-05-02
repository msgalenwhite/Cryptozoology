class ApplicationController < ActionController::Base

 protect_from_forgery unless: -> { request.format.json? }

 before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_photo, :bio])
 end

 before_action :set_categories
 before_action :set_regions

 def set_categories
   @categories = Category.all
 end

 def set_regions
   @regions = Region.all
 end
end
