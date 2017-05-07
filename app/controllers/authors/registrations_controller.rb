class Authors::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
    before_filter :configure_permitted_parameters

  # GET /resource/sign_up
  # def new
  #   super
  # end



  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

def author_params
  params.require(:author).permit(:name, :email, :author_id, :avatar)
end

  def configure_sanitized_params
  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :avatar)}
  devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :avatar)}

  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |author_params|
      author_params.permit(:name, :avatar,
      :email, :password, :password_confirmation)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update
   devise_parameter_sanitizer.for(:update)   do |author_params|
      author_params.permit(:name, :avatar,
      :email, :password, :password_confirmation)
    end 
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  end
end
