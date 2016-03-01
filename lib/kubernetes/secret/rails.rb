require 'rails'
require 'kubernetes/secret/rails/version'

module Kubernetes
  module Secret
    module Rails
      class Railtie < ::Rails::Railtie
        config.after_initialize do 
          ::Rails.application.secrets.merge!({kubernetes: 'blah'})
        end
      end
    end
  end
end