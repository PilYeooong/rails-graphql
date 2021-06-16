module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :user, resolver: Resolvers::QueryType::UserResolver
    field :users, resolver: Resolvers::QueryType::UsersResolver
  end
end
