class Asset < ApplicationRecord
  has_many :invested_assets, dependent: :destroy
end
