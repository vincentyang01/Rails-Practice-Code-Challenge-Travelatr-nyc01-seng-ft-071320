class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end
    def new
        @blogger = Blogger.new
    end
    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
            flash[:message] = "Something is wrong"
        end
    end
    def show
        blogger_find
    end
    def edit
        blogger_find
    end
    def update
        blogger_find
        @blogger.update(blogger_params)
        redirect_to blogger_path(@blogger)
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
    def blogger_find
        @blogger = Blogger.find(params[:id])
    end
end