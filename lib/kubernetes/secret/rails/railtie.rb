require 'kubernetes/secret'

module Kubernetes
  module Secret
    module Rails
      class Railtie < ::Rails::Railtie        
        config.before_configuration do 
          ::Rails.application.secrets.merge!({kubernetes: Secret.load_secrets})
        end
      end
    end
  end
end