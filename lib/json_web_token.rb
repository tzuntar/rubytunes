class JsonWebToken
  class << self
    def encode(payload, expiry = 24.hours.from_now)
      payload[:expiry] = expiry.to_i
      JWT.encode(payload, Rails.application.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end