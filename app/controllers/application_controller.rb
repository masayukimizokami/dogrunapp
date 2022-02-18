class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
   
    private
    def configure_permitted_parameters
      #user新規作成時に名前を保存
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      #user編集時に名前、imageを保存
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:image])
    end
end
