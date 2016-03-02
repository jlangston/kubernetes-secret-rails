require 'kubernetes/secret'

module Kubernetes
  module Secret
    module Rails
      class Railtie < ::Rails::Railtie        
        config.before_configuration do 
          if Secret.on_kubernetes?
            ::Rails.application.secrets.merge!(Secret.load_secrets)
          end
        end
      end
    end
  end
end