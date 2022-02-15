class CommentsController < ApplicationController
  layout 'comment'
  before_action :set_q
  before_action :authenticate_user!

  # GET /comments or /comments.json
  def index
    @comment = current_user.comments
  end

  # GET /comments/1 or /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end


  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment = current_user.comments.build(comment_params)
      if @comment.save
        flash[:notice] = "投稿完了しました"
        redirect_to :dogruns
      else
        flash[:notice] = "投稿失敗しました"
        render dogrun_path(params[:comment][:dogrun_id])
      end
  end
  


  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:contents, :dogrun_id, :user_id, :title)
    end

    def set_q
      @q = Dogrun.ransack(params[:q])
    end
end
