class JwtToken
  HMAC_SECRET = 'secret'
  EXPIRED_IN = 90 * 24 * 3600

  def self.generate_token(data)
    exp = Time.now.to_i + EXPIRED_IN
    iat = Time.now.to_i
    iss = 'railsql'
    payload = { data: data, exp: exp, iat: iat, iss: iss }
    encode(payload)
  end

  def self.encode(payload)
    token = JWT.encode payload, HMAC_SECRET, 'HS512'
    token
  end

  def self.decode(token)
    decoded = JWT.decode token, HMAC_SECRET, true , { verify_iat: true, verify_iss: true, algorithm: 'HS512' }
    decoded
  end

  def self.get_nickname(decoded_token)
    decoded_token[0]['data']['username']
  end

  def self.get_user_id(decoded_token)
    decoded_token[0]['data']['user_id']
  end

  def self.check_decode(token)
    begin
      decoded_token = decode(token)
      user_id = get_user_id(decoded_token)
      raise Exception.new('Invalid User Id') if user_id.nil?

      return user_id
    rescue  Exception => e
      puts e
      return nil
    end
  end

  def self.verify(token)
    user_id = check_decode(token)
    return nil if user_id.nil?

    @user = User.find_by(id: user_id)
    return nil if @user.nil?

    return @user
  end
end