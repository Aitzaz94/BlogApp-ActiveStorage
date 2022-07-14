class BlogsController < ApplicationController

  def index
    @user ||= current_user
    @blogs = @user.blogs.all if @user
  end


  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "Blog successfully created"
      redirect_to blog_path(@blog)
    else
      flash[:notice] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        flash[:notice] = "Blog was successfully updated"
        redirect_to blog_path(@blog)
      else
        flash[:notice] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:notice] = 'Blog was successfully deleted.'
      redirect_to blogs_path
    else
      flash[:notice] = 'Something went wrong'
      redirect_to blogs_path, status: :see_other
    end
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :description, :user_id)
  end

end
