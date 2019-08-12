class CommentsController < ApplicationController
  def create
    board = Board.find(params[:board_id])
    
    board.comments.create(body: params[:body], user: current_user)
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    
    redirect_back(fallback_location: root_path)
  end
end
