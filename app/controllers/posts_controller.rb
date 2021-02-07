class PostsController < ApplicationController
    before_action :set_post, only: [:show, :upvote, :edit, :update]

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            @bloggers = Blogger.all
            @destinations = Destination.all
            render :new
        end
    end

    def edit
    end

    def update
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

end