class ProfilesController < ApplicationController
  layout 'profile'
  before_action :set_q
  before_action :authenticate_user!

  # user投稿済みdogrun一覧ページ
  def index
    @dogrun = current_user.dogruns
  end

  # プロフィールshowページ
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:profile, :image, :name)
  end

  def set_q
    @q = Dogrun.ransack(params[:q])
  end
end
