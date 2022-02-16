class UsersController < ApplicationController
  layout 'user'

   def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
   end

   def index
    @dogrun = current_user.dogruns
   end

   def edit
    @user = User.find(params[:id])
   end

   def show
    @user = User.find(params[:id])
   end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
   end

   private
   def user_params
     params.require(:user).permit(:name, :email, :profile, :encrypted_password,:image)
   end

end
