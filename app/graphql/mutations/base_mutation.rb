module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def check_current_user!
      user = context[:current_user]
      error_message = "Need Login"
      Errors.gql_error!(Errors::INVALID_REQUEST, error_message) if user.nil?

      return user
    end
  end
end
