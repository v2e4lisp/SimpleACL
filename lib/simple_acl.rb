require 'simple_acl/railtie'
require 'active_support/concern'

module SimpleACL
  extend ActiveSupport::Concern

  included do
    before_action do
      next if !current_user || authorized_roles.empty?
      next if authorized_roles.any? {|role|
        role.split("&").all? {|r| current_user.has_role? r.strip }
      }

      access_denied
    end
  end

  def roles
    @@roles
  end

  def self.load_roles
    @@roles = YAML.load_file File.open(File.join(Rails.root, "config", "roles.yml"))
  end

  def authorized_roles
    controller_name, method_name = self.class.name, self.action_name
    current_roles = roles[controller_name]
    Array(current_roles[method_name]) | Array(current_roles["ALL"])
  end

  def access_denied
    head :forbidden
  end
end
