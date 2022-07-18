class UsersController < ApplicationController

    def index
        @image = Image.find(params[:id])
    end

    def show
      @user = User.find_by(username: params[:username])
      @images = @user.images.order(created_at: :desc)
    end
  end