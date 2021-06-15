class Mutations::CreateUser < Mutations::BaseMutation
  type Types::UserType

  argument :user, Types::CreateUserType, required: true

  def resolve(user:)
    email = user.try(:email)
    password = user.try(:password)
    nickname = user.try(:nickname)

    begin
      user = User.create!(email: email, password: password, nickname: nickname)

    rescue Exception => e
      pp e
      {
        error: e.full_message
      }
    end

    {
      email: user.email,
      nickname: user.nickname
    }
  end
end