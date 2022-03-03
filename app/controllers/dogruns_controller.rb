class DogrunsController < ApplicationController
  layout 'dogrun'
  before_action :set_q
  before_action :authenticate_user!

  # topページ
  def top; end

  # 一覧ページ
  def index
    @dogruns = Dogrun.last(5)
    @comments = Comment.last(10)
  end

  # 検索ページ
  def search
    @results = @q.result
  end

  # GET /dogruns/1 or /dogruns/1.json
  def show
    @dogrun = Dogrun.find(params[:id])
    @comment = Comment.new # 新規コメント投稿
    @comments = @dogrun.comments
  end

  # GET /dogruns/new
  def new
    @dogrun = Dogrun.new
  end

  # GET /dogruns/1/edit
  def edit
    @dogrun = Dogrun.find(params[:id])
  end

  # POST /dogruns or /dogruns.json
  def create
    @dogrun = Dogrun.new(dogrun_params)
    @dogrun.user = current_user
      if @dogrun.save
        redirect_to dogrun_url(@dogrun), notice: '新規投稿できました。' 
      else
        render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /dogruns/1 or /dogruns/1.json
  def update
    @dogrun = Dogrun.find(params[:id])
      if @dogrun.update(dogrun_params)
        redirect_to dogrun_url(@dogrun), notice: '更新できました。' 
      else
         render :edit, status: :unprocessable_entity 
      end
  end

  # DELETE /dogruns/1 or /dogruns/1.json
  def destroy
    @dogrun = Dogrun.find(params[:id])
    @dogrun.destroy
      redirect_to dogruns_url, notice: '削除しました。' 
  end

  private

  # Only allow a list of trusted parameters through.
  def dogrun_params
    params.require(:dogrun).permit(:dogrun_name, :image, :address, :price, :pr, :area)
  end

  def set_q
    @q = Dogrun.ransack(params[:q])
  end
end
