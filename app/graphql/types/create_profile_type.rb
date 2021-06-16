class Types::CreateProfileType < Types::BaseInputObject
  argument :age, String, required: true
  argument :gender, Types::GenderType, required: true
  argument :user_id, ID, required: true
end