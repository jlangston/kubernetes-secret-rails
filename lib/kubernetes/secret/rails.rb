begin
  require "rails"
rescue LoadError
else
  require "kubernetes/secret/rails/railtie"
end