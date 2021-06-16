class Mutations::CreateProfile < Mutations::BaseMutation
  field :profile, Types::ProfileType, null: false

  argument :profile, Types::CreateProfileType, required: true

  def resolve(profile:)
    age = profile.try(:age)
    gender = profile.try(:gender)
    user_id = profile.try(:user_id)

    begin
      ex_user = User.find(user_id)

      profile = Profile.create!(age: age, gender: gender, user: ex_user)
    rescue Exception => e
      raise Errors::gql_error!(Errors::INVALID_REQUEST, e)
    end

    {
      profile: profile
    }
  end
end