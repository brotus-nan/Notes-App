# app/controllers/concerns/authentication.rb
module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :is_logged?
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_if_authenticated
    redirect_to root_path, alert: "You are already logged in." if is_logged?
  end

  private

  def current_user
    Current.user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def is_logged?
    Current.user.present?
  end

end
