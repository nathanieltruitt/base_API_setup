# frozen_string_literal: true

# defines JSON blueprint for user model
class UserBlueprint < Blueprinter::Base
  identifier :id
  fields :first_name, :last_name, :email

  view :login do
    assocation :token, blueprint: TokenBlueprint do |user, _options|
      user.tokens.last
    end
  end

  view :normal do
    fields :first_name, :last_name, :email, :phone
  end
end
