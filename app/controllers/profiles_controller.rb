class ProfilesController < ApplicationController
  layout 'profile'
  before_action :set_q
  before_action :authenticate_user!
 
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice]="プロフィールを編集しました"
     redirect_to profiles_path(@user)
    else
     flash[:notice]="プロフィールを編集できませんでした"
     render"edit"
    end

  end

  private
    def user_params
      params.require(:user).permit(:profile, :image,:name)
    end

    def set_q
      @q = Dogrun.ransack(params[:q])
    end
end
