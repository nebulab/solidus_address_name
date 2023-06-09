# frozen_string_literal: true

module SolidusAddressName
  module AddressDecorator
    def self.prepended(base)
      base.alias_attribute :first_name, :firstname
      base.alias_attribute :last_name, :lastname
      base.alias_attribute :full_name, :name

      base.ignored_columns = []
    end

    Spree::Address.prepend(self)
  end
end
