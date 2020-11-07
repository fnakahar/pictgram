class CommentsController < ApplicationController
    
    def new
        @comment = Comment.new
        @comment.user_id = current_user.id
        @comment.topic_id = params[:topic_id]
    end
    
    def create
       comment = current_user.comments.new(comment_params)
    
        if comment.save
            redirect_to topics_path, success: 'コメントを投稿しました'
        else
            redirect_to topics_path, danger: 'コメントの投稿に失敗しました'
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:user_id, :topic_id, :description)
    end
    
    
end
