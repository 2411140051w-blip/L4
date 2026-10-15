class User < ApplicationRecord
    def pass=(raw_password)
    self[:pass] = BCrypt::Password.create(raw_password).to_s
  end
end
