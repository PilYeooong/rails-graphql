class Types::CreateUserType < Types::BaseInputObject
  argument :email, String, required: true
  argument :password, String, required: true
  argument :nickname, String, required: false
end