class CommentsController < ApplicationController
  def create
    @song = Song.find(params[:song_id])
    @comment = @song.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to song_url(@song), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to song_url(@song), alert: "There was a problem with your comment." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    unless @comment.user == current_user
      redirect_to root_path, notice: "Unauthorized."
    end
  end
end