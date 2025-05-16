class PostsController < ApplicationController

    def index
        @posts = Post.all.order(updated_at: :desc)
        if params[:id].present?
            @post = Post.find(params[:id])
            @user = User.find_by(id: @post.user_id)
        else
            @post = Post.new #空のインスタンスを生成
        end
    end

    def new
        if user_signed_in?
            @post = Post.new #空のインスタンスを生成
        else
            flash[:alert] = '新規投稿するにはアカウントを作成してください。またはログインしてください。'
            puts "ログインしていないユーザーが投稿しようとしています。" # デバッグ用
            redirect_to new_user_registration_path # アカウント作成ページへリダイレクト
        end
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        # binding.pry
        if @post.save
            flash[:notice] = '正常に投稿されました。'
            redirect_to action: 'index' 
        else
            flash[:notice] = '投稿に失敗しました。'
            redirect_to action: 'new' 
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = '投稿が更新されました。'
            redirect_to action: 'index' 
        else
            flash.now[:alert] = '投稿の更新に失敗しました。'
            redirect_to action: 'edit' 
        end
    end


    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = '投稿が削除されました。'
        redirect_to action: 'index' 
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params #ストロングパラメータ
        params.require(:post).permit(:title, :content, :phoneNumber, :image)  #パラメーターのキー
    end
end
