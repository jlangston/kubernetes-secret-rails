require 'rails'
require 'kubernetes/secret/rails/version'

module Kubernetes
  module Secret
    module Rails
      class Railtie < ::Rails::Railtie
        Rails.application.secrets.merge({ blah: 'blah' })
      end
    end
  end
end