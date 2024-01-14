class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create]
    before_action :set_user, only: [:show]
  
    def index
      @users = User.all
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save  
          session[:user_id] = @user.id
          format.html { redirect_to root_url, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :points, :gems)
      end
  end
