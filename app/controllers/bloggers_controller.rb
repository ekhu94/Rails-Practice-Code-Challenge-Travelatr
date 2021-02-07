class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show]

    def index
        @bloggers = Blogger.all
    end

    def show
    end

    private

    def set_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end