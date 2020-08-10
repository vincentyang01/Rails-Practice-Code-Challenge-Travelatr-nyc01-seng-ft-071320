class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end
    def show
        @post = Post.find_by(params[:id])
    end
    def edit
        @post = Post.find(params[:id])
    end
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
    # def find_post
    #     @post = Post.find(params[:id])
    # end
end