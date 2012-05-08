module SimpleHasher
  class SimpleHasherRailtie < Rails::Railtie
    config.simple_hasher = ActiveSupport::OrderedOptions.new

    initializer 'simple_hasher.allowed_chars' do |app|
      SimpleHasher.configure do |config|
        config.allowed_chars = app.config.simple_hasher[:allowed_chars]
      end
    end
  end
end
