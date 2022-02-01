class ApplicationController < ActionController::API
  before_action :authorized
  SECRET_KEY = 'HaNJLisLook1ng'.freeze

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split[1]
    # header: { 'Authorization': 'Bearer <token>' }
    begin
      JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    # The !! is here to ensure that if logged_in_user return nil, this function will return false
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
