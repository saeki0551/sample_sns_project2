# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    # ここでUser.new（と同等の操作）を行う
    build_resource(sign_up_params)

    # ここでUser.save（と同等の操作）を行う
    resource.save

    # 保存後にUserMailerを使ってwelcomeメールを送信
    # UserMailer.with(user: @user).welcome_email.deliver_later


    yield resource if block_given?

    if resource.persisted?
      set_flash_message! :notice, :signed_up
      # sign_up(resource_name, resource) を呼ばないことで自動ログインを防ぐ
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  # アカウント作成後のリダイレクト先を指定
  def after_sign_up_path_for(resource)
    flash[:notice] = "アカウントが作成されました。ログインしてください。"
    new_user_session_path # ログインページへリダイレクト
  end
end
