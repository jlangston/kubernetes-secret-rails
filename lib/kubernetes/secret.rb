require 'rails'

module Kubernetes
  module Secret
    def self.get(key)
      File.read("/etc/#{Rails.application.secret.kubernetes_secret_name}/#{key}")
    end
  end
end