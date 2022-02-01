class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  before_action :authorized
  SECRET_KEY = 'HaNJLisLook1ng'

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    cookies.signed[:jwt]
  end

  def decoded_token
    return unless auth_header
    puts auth_header
    # header: { 'Authorization': 'Bearer <token>' }
    begin
      JWT.decode(auth_header, SECRET_KEY, true, algorithm: 'HS256')
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
