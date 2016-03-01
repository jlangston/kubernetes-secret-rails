module Kubernetes
  module Secret
    extend self

    def path
      "/etc/#{::Rails.application.secrets.kubernetes_secret_name}"
    end

    def secrets_list
      Dir.entries(path) - ['.', '..']
    end

    def load_secrets
      secrets_list.inject({}) do |hash, file_name|
        hash.merge(file_name => File.read(File.join(path, file)))
        hash
      end
    end
  end
end

require 'kubernetes/secret/rails'