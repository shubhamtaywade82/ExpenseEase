# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    include RackSessionsFix

    respond_to :json
    # before_action :configure_sign_in_params, only: [:create]

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    private

    def respond_with(current_user, _opts = {})
      render json: {
        status: {
          code: 200, message: 'Logged in successfully.',
          data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
        }
      }, status: :ok
    end

    def respond_to_on_destroy
      current_user = find_current_user

      if current_user
        render json: { status: 200, message: 'Logged out successfully.' }, status: :ok
      else
        render json: { status: 401, message: "Couldn't find an active session." }, status: :unauthorized
      end
    end

    def find_current_user
      return nil if request.headers['Authorization'].blank?

      jwt_payload = decode_jwt_token(request.headers['Authorization'].split.last)
      User.find_by(id: jwt_payload['sub'])
    end

    def decode_jwt_token(token)
      JWT.decode(
        token,
        Rails.application.credentials.devise_jwt_secret_key!
      ).first
    rescue JWT::DecodeError => e
      raise StandardError, "JWT decode error: #{e.message}"
    end
  end
end
