# Kubernetes Secret

This gem helps you work with secrets in kubernetes. If you are deploying your app using docker + kubernetes this gem can come in handy.

The gem is a simple wrapper and will inject kubernetes secrets into the `Rails.application.secrets`

## Installation

Add this line to your application's Gemfile:

```ruby
group :production do 
  gem 'kubernetes-secret-rails'
end

# or

gem 'kubernetes-secret-rails', group: :production
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kubernetes-secret-rails

## Usage

Simply use `Rails.application.secrets` to access all the secrets you have on kubernetes.

For example if your secret is called `rails-env` on kubernetes it will map to

`Rails.application.secrets.rails_env`

Specify the name of the secret in your `config/secrets.yml file`

```ruby
production:
  kubernetes_secret_name: 'blah'
```

This will work with Google Container Engine out of the box.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/kubernetes-secret-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

