# frozen_string_literal: true

FactoryBot.modify do
  # Revert the firstname and lastname to their original values before
  # https://github.com/solidusio/solidus/pull/3584/files#diff-8e88fbe32e58692ffaf3629a7fdfdadfa4378dd248a011fc8d2d266a5ed299a4
  factory :address do
    transient do
      name { nil }
    end

    firstname { 'John' }
    lastname { nil }
  end
end

FactoryBot.define do
end
