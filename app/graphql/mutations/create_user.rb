class Mutations::CreateUser < Mutations::BaseMutation
  field :user, Types::UserType, null: false

  argument :user, Types::CreateUserType, required: true

  def resolve(user:)
    email = user.try(:email)
    password = user.try(:password)
    nickname = user.try(:nickname)

    begin
      user = User.create!(email: email, password: password, nickname: nickname)

    rescue Exception => e
      raise Errors::gql_error!(Errors::INVALID_REQUEST, e)
    end

    {
      user: user
    }
  end
end