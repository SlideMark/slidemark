class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # fix devise params bug
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    render_need_login
  end

  def render_not_permit
    render template: "errors/not_permit", status: 500, layout: 'signin', content_type: 'text/html'
  end

  def render_need_login
    redirect_to new_user_session_url, flash: {alert: I18n.t('devise.failure.unauthenticated')}
  end

  unless Rails.env.development?
    #rescue_from Exception, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404

    def render_404
      render template: "errors/error_404", status: 404, content_type: 'text/html'
    end

    def render_500
      render template: "errors/error_500", status:  500
    end
  end
end
