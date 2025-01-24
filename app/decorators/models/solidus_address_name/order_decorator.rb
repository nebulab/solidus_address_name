# frozen_string_literal: true

module SolidusAddressName
  module OrderDecorator
    def self.prepended(base)
      base.delegate :firstname, :lastname, to: :bill_address, prefix: true, allow_nil: true

      base.alias_method :billing_firstname, :bill_address_firstname
      base.alias_method :billing_lastname, :bill_address_lastname
    end

    Spree::Order.prepend(self)
  end
end
