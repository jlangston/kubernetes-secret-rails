require 'rails'
require 'kubernetes/secret/version'

module Kubernetes
  module Secret
    def self.read(key)
      File.read("/etc/#{Rails.application.secrets.kubernetes_secret_name}/#{key}")
    end

    class Engine < ::Rails::Engine
      Rails.application.secrets.merge({blah: 'blah'})
    end
  end
end