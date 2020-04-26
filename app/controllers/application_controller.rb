class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  before_action :current_user
  helper_method :current_user

   rescue_from ActionController::RoutingError, :with => :not_found
   rescue_from ActiveRecord::RecordNotFound, :with => :not_found

 def after_sign_in_path_for(resource)
    @user = current_user

    if @user.present?
      return '/questions'
    end

 end

 def after_sign_out_path_for(resource)
      return '/login'
 end

end
