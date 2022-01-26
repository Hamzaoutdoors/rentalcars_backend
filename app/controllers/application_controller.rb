class ApplicationController < ActionController::API

  def secret_key
    "anything" #a string of your choosing
  end

  def encode(payload)
    JWT.encode(payload, secret_key, 'HS256')
  end

  def decode(token)
    JWT.decode(token, "anything", true, {algorithm: 'HS256'})[0]
  end

end
