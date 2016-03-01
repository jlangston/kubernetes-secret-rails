module Kubernetes
  module Secret
    module Rails
      class Railtie < ::Rails::Railtie
        config.after_initialize do 
          ::Rails.application.secrets.merge!({kubernetes: Secret.load_secrets})
        end
      end
    end
  end
end