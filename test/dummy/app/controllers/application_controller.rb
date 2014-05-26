class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SimpleACL

  class User
    def self.roles= roles
      @roles = roles
    end

    def self.roles
      @roles || []
    end

    def has_role? role
      (class << self; self; end).roles.include? role
    end
  end

  def current_user
    @user ||= User.new
  end
end
