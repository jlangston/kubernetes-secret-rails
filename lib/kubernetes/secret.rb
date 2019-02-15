# frozen_string_literal: true

module Kubernetes
  module Secret
    module_function

    def path
      if Rails.application.secrets.kubernetes_secret_name.blank?
        throw 'No kubernetes secrets path defined.'
      end
      "/etc/#{Rails.application.secrets.kubernetes_secret_name}"
    end

    def secrets_list
      puts "K8s path for secrets #{path}"
      Dir.entries(path).select { |f| File.file?("#{path}/#{f}") }
    rescue StandardError => e
      puts e
      puts '-----> No secret mounted or not on kubernetes. No secrets injected.'
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
