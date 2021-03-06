class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    image_url = auth_hash[:info][:image]

    self.find_or_create_by(provider: provider,uid: uid) do |user|
      user.username = name
      user.image_url = image_url
    end
  end
end
