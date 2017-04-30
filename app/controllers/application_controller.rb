class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |author_params|
      author_params.permit(:name, :email, :avatar)
    end
  end
end
