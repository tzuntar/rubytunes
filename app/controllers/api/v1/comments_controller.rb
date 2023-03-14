class Api::V1::CommentsController < ActionController::API

  def create
    @song = Song.find(params[:song_id])
  end

  private

  # only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_commend_owner
    unless @comment.user == @current_api_user
      render json: { error: 'Unauthorized request.' },
             status: :unauthorized
    end
  end

end