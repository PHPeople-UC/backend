class RegistrationsController < Devise::RegistrationsController
  def create
    avatar = params[:user][:avatar]
    params = sign_up_params
    @user = User.new(params)
    @user.avatar.attach(avatar)
    if @user.save
      render json: @user.as_json(methods: :avatar_url)
    else
      render json: { errors: @user.errors }
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :name, :last_name, :password, :password_confirmation)
  end
end
