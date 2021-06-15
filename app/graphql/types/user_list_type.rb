module Types
  class UserListType < Types::BaseObject
    field :users, [Types::UserType], null: false
  end
end