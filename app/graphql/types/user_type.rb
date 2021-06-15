module Types
  class UserType < Types::BaseObject
    field :email, String, null: false
    field :nickname, String, null: true
    field :profile, Types::ProfileType, null: true
    field :created_at, String, null: false
  end
end
