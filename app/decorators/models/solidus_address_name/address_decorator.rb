# frozen_string_literal: true

module SolidusAddressName
  module AddressDecorator
    def self.prepended(base)
      base.alias_attribute :first_name, :firstname
      base.alias_attribute :last_name, :lastname
      base.alias_attribute :full_name, :name

      base.ignored_columns = []
      if base.method_defined?(:allowed_ransackable_attributes)
        base.allowed_ransackable_attributes.push(:firstname, :lastname)
      else
        base.whitelisted_ransackable_attributes.push(:firstname, :lastname)
      end
    end

    def name
      "#{firstname} #{lastname}".strip
    end

    def name=(value)
      return if value.nil?

      name_from_value = Spree::Address::Name.new(value)
      write_attribute(:firstname, name_from_value.first_name)
      write_attribute(:lastname, name_from_value.last_name)
      write_attribute(:name, value)
    end

    Spree::Address.prepend(self)
  end
end
