class BlogsController < ApplicationController

  include BlogsHelper

before_action :authenticate_user!, except: [:index, :show]

  def index
    # @user ||= current_user
    # @blogs = @user.blogs.all if @user
    # @blogs = Blog.all
    @blogs = Blog.paginate(page: params[:page], per_page: 3)
    authorize @blogs
  end

  def new
    @blog = Blog.new
    @blog.search_opmtimizations.build
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      author = @blog.user
      BlogMailer.new_blog(author, @blog).deliver_now
      flash[:success] = "Blog successfully created"
      redirect_to blog_path(@blog)
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
    # author = @blog.user
    # authorize author
  end


  def edit
    @blog = Blog.find(params[:id])
  end

  def update
      @blog = Blog.find(params[:id])
      
      author = @blog.user
      authorize author
      if @blog.update(updation_params)
        BlogMailer.update_blog(author, @blog).deliver_now
        flash[:success] = "Blog was successfully updated by admin"
        redirect_to blog_path(@blog)
      else
        flash[:danger] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @blog = Blog.find(params[:id])
    author = @blog.user
    if @blog.destroy
      BlogMailer.delete_blog(author, @blog).deliver_now
      flash[:danger] = 'Blog was successfully deleted.'
      redirect_to blogs_path
    else
      flash[:danger] = 'Something went wrong'
      redirect_to blogs_path, status: :see_other
    end
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :description, :user_id, image: [], category_ids: [], search_opmtimizations_attributes: [:keyword, :city])
  end

  def updation_params
    params.require(:blog).permit(:title, :description, image: [], category_ids: [], search_opmtimizations_attributes: [:keyword, :city])
  end

end
