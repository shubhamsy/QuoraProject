# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
  
  end
  def set_email
    if params[:email] !~ /\D/
      params[:email] =User.find_by(email: params[:email])
    end
  end
  # POST /resource/sign_in
  def create
    # password = @key.private_decrypt(Base64.decode64(params[:spree_user][:password]))
    if  @user.present?
      sign_in(@user)
    end

    if user_signed_in?
        respond_to do |format|
          format.html {
            flash[:success] = User.t(:logged_in_succesfully)
            redirect_back_or_default(after_sign_in_path_for(current_user))
          }
        end
    else
        respond_to do |format|
          format.html {
            #notice: 'Email / mobile, password did not match '
            flash.now[:error] = User.t('Username/Password Incorrect.')
            render :new
          }
          format.js {
            render :json => { error: t('devise.failure.invalid') }, status: :unprocessable_entity
          }
        end
     end
   end

  # DELETE /resource/sign_out
  def destroy
    if sign_out
      redirect_to(after_sign_out_path_for(current_user))
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
