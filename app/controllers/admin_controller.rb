class AdminController < ApplicationController
  before_action :check_self

  private

    def check_self
      if (current_user.nil? || (current_user.id != params[:user_id].to_i))
        raise CanCan::AccessDenied.new
      end
    end
end
