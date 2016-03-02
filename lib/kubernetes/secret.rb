module Kubernetes
  module Secret
    extend self

    def path
      "/etc/#{::Rails.application.secrets.kubernetes_secret_name}"
    end

    def secrets_list
      begin
        Dir.entries(path) - ['.', '..']
      rescue => e
        puts "-----> No secret mounted or not on kubernetes. No secrets injected."
      end
    end

    def on_kubernetes?
      secrets_list.present?
    end

    def load_secrets
      secrets_list.inject({}) do |hash, file_name|
        hash.merge(:"#{file_name.underscore}" => File.read(File.join(path, file_name)).strip)
      end
    end
  end
end