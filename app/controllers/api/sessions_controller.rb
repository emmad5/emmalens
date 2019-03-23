class Api::SessionsController < ApplicationController

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login!(@user)
            render "api/users/show"
        else
            render json: {base: ['Invalid credentials']}, status: 401
        end
    end

    def destroy
        if current_user
            logout!
            render json: {}
        else
            render json: {base: ['you are not logged in']}, status: 401
        end

    end



end