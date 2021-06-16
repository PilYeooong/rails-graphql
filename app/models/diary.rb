class Diary < ApplicationRecord
  belongs_to :user
  has_many :invested_assets, dependent: :destroy
end
