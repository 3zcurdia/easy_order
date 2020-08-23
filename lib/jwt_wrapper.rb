module JwtWrapper
  def self.encode(payload, expiration = 360)
    payload = payload.dup
    payload['exp'] = expiration.to_i.hours.from_now.to_i

    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)

    decoded_token.first
  rescue
    nil
  end
end
