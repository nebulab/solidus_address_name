# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ActiveSupport::Deprecation, type: :model do
  describe '.warn' do
    subject { described_class.warn(message) }


    before { allow(Spree).to receive(:solidus_gem_version).and_return(solidus_version) }

    [:firstname, :lastname, :full_name].each do |method|
      context 'when solidus version is lower than 3.0' do
        let(:solidus_version) { Gem::Version.new('2.11.17') }

        context "#{method}" do
          let(:message) { "#{method} is deprecated and will be removed from Solidus 3.0 (use name instead)" }

          it "suppress warn for Spree::Address##{method} deprecation" do
            is_expected.to be_nil
          end
        end
      end

      context 'when solidus version is not lower than 3.0' do
        let(:solidus_version) { Gem::Version.new('3.0.0') }

        context "#{method}" do
          let(:message) { "#{method} is deprecated and will be removed from Solidus 3.0 (use name instead)" }

          it "does not suppress warn for Spree::Address##{method} deprecation" do
            is_expected.not_to be_nil
          end
        end
      end
    end
  end
end
