module SimpleACL
  class Railtie < Rails::Railtie
    initializer "SimpleACL.load_roles" do
      ::SimpleACL.load_roles
    end
  end
end
