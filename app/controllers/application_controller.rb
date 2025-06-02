class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :ensure_html_format
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "正常にログインしました。" 
    posts_path
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "アカウントが作成されました。"  # フラッシュメッセージを設定
    new_user_session_path 
  end

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end   

  private
  def ensure_html_format
    request.format = :html if request.format.nil? || request.format.json?
  end

end
