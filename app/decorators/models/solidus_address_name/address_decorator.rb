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

      base.before_save :copy_split_name
    end

    def copy_split_name
      self.name = "#{firstname} #{lastname}".strip
    end

    Spree::Address.prepend(self)
  end
end
