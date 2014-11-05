class Users::RegistrationsController < Devise::RegistrationsController
  layout 'signin'
  def new
    super
  end

  def create
    super
  end
end
