class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :ensure_html_format
  
  def after_sign_in_path_for(resource)
    flash[:notice] = "正常にログインしました。" 
    posts_path
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "アカウントが作成されました。"  # フラッシュメッセージを設定
    new_user_session_path 
  end

  private
  def ensure_html_format
    request.format = :html if request.format.nil? || request.format.json?
  end
      
end
