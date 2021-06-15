module Resolvers
  module QueryType
    class UserListResolver < Resolvers::BaseResolver
      type Types::UserListType, null: false

      def resolve(**args)
        users = User.all

        {
          users: users
        }
      end
    end
  end
end