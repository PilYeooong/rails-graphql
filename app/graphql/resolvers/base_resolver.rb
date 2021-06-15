module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver

    def check_current_user!
      user = context[:current_user]
      error_message = "Need Login"
      Errors.gql_error!(Errors::INVALID_REQUEST, error_message) if user.nil?

      return user
    end
  end
end