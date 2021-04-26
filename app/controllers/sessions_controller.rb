class SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      @current_user = user
      render json: { user: UserSerializer.new(@current_user, with_token: true) },
             status: :created
    else
      render json: {
        errors: { 'email or password' => ['is invalid'] }
      }, status: :unprocessable_entity
    end
  end
end
