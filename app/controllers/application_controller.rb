class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,
        :password_confirmation, :remember_me, :image, :image_cache, :remove_image, :role) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
        :password_confirmation, :current_password, :image, :image_cache, :remove_image, :role) }
    end

    private

    def user_not_authorized
        flash[:alert] = "Access Denied"
        redirect_to (request.referrer || root_path)
    end
end
