class AuthenticationTokenService
    require 'jwt'
    require 'dotenv'
    Dotenv.load('.env')
    HMAC_SECRET = ENV['MI_CLAVE']

    def self.encode(payload)
      JWT.encode payload, HMAC_SECRET, 'HS256'  
    end

    def self.decode(token)
      JWT.decode token, HMAC_SECRET, true, { algorithm: 'HS256' }
    end

end