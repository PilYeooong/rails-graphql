module Resolvers
  module QueryType
    class UserResolver < Resolvers::BaseResolver
      type Types::UserType, null: false

      argument :user_id, ID, required: true

      def resolve(user_id:)
        check_current_user!

        user = User.find(user_id)

        {
          email: user.email,
          nickname: user.nickname,
          profile: user.profile,
          created_at: user.created_at
        }
      end
    end
  end
end