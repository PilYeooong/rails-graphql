module Resolvers
  module QueryType
    class UsersResolver < Resolvers::BaseResolver
      type [Types::UserType], null: false

      def resolve
        check_current_user!

        User.all

      end
    end
  end
end