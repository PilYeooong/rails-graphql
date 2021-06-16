module Resolvers
  module QueryType
    class UserResolver < Resolvers::BaseResolver
      type Types::UserType, null: false

      argument :user_id, ID, required: true

      def resolve(user_id:)
        check_current_user!

        find_user = User.find(user_id)

        {
          user: find_user
        }
      end
    end
  end
end