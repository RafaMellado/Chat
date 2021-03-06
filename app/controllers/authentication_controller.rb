class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login
  
    # POST /auth/login
    def login
      @user = User.where(name: params[:name]).first

      if @user.nil?
        @user = User.new(name: params[:name])
        if !@user.save
            render json: @user.errors, status: :unprocessable_entity
            return
        end
      end
      if @user
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       name: @user.name, id: @user.id }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end
  
    private
  
    def login_params
      params.permit(:name)
    end
end