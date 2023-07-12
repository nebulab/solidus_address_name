# frozen_string_literal: true

module ActiveSupport
  module DeprecationDecorator
    def warn(message = nil, callstack = caller)
      if Spree.solidus_gem_version < Gem::Version.new('3.0')
        return if message == 'firstname is deprecated and will be removed from Solidus 3.0 (use name instead)'
        return if message == 'lastname is deprecated and will be removed from Solidus 3.0 (use name instead)'
        return if message == 'full_name is deprecated and will be removed from Solidus 3.0 (use name instead)'
      end

      super
    end

    ::ActiveSupport::Deprecation.prepend self
  end
end
