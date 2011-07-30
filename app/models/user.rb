class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.nickname = auth["extra"]["user_hash"]["login"]
      user.gravatar_id = auth["extra"]["user_hash"]["gravatar_id"]
      user.token = auth["credentials"]["token"]
    end
  end

end
