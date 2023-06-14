# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusAddressName
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_address_name'

    initializer "solidus_address_name.add_static_preference" do |_app|
      Spree::PermittedAttributes.address_attributes.concat(%i[
        firstname lastname
      ])
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
