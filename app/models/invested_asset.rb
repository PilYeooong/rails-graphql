class InvestedAsset < ApplicationRecord
  belongs_to :diary
  belongs_to :user
  belongs_to :asset
end
