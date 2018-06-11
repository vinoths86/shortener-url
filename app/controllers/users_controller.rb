class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: {
          status: true,
          data: user.as_json.slice('name', 'auth_token')
      }, status: :created
    else
      render json: {
          status: false,
          data: user.errors.full_messages
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
