class CategoriesController < ApplicationController

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
          flash[:success] = "Object successfully created"
          redirect_to categories_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    

    def show
        @category = Category.find(params[:id])
        @category_blogs = @category.blogs.paginate(page: params[:page], per_page: 5)
    end
    
    private

    def category_params
        params.require(:category).permit(:name)
    end

end