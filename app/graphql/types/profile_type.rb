class Types::ProfileType < Types::BaseObject
  field :age, String, null: true
  field :gender, Types::GenderType, null: true
  field :user, Types::UserType, null: false
end