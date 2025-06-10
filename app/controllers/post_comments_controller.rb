class PostCommentsController < ApplicationController

    def new
        @post = Post.find(params[:post_id])
        @post_comment = PostComment.new #空のインスタンスを生成
    end

    def create
        @post = Post.find(params[:post_id])
        @post_comment = PostComment.new(post_comment_params)
        @post_comment.user_id = current_user.id
        @post_comment.post_id = @post.id
        @post_comment.save
        redirect_to controller: 'posts', action: 'index'
    end

    def destroy
        @post_comment = PostComment.find(params[:post_comment_id])
        @post_comment.destroy
        redirect_to request.referer
    end 

    private

    def post_comment_params
    params.require(:post_comment).permit(:comment)
    end
end
