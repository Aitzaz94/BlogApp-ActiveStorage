class BlogsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]

  def index
    # @user ||= current_user
    # @blogs = @user.blogs.all if @user
    @blogs = Blog.all
    authorize @blogs
  end

  def purge_image
    @blog = Blog.find(params[:id])
    @blog.image.purge
    redirect_back fallback_location: root_path, notice: "success(deletion)"
  end

  def update_image
    @blog = Blog.find(params[:id])
    if !@blog.image.present?
      # if @blog.update(blog_params)
      #   flash[:success] = "Blog was successfully updated"
      #   redirect_to blog_path(@blog)
      # else
      #   flash[:danger] = "Something went wrong"
      #   render 'edit'
      # end
    else
      # flash[:danger] = "Image has_one present"
      # redirect_to blog_path(@blog)
      @blog.image.purge
      redirect_to update_image_blog_path(@blog)
    end
  end

  def new
    @blog = Blog.new
    @blog.search_opmtimizations.build
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:success] = "Blog successfully created"
      redirect_to blog_path(@blog)
    else
      flash[:danger] = "Something went wrong"
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
      flash[:success] = "Blog was successfully updated"
      redirect_to blog_path(@blog)
    else
      flash[:danger] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:danger] = 'Blog was successfully deleted.'
      redirect_to blogs_path
    else
      flash[:danger] = 'Something went wrong'
      redirect_to blogs_path, status: :see_other
    end
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :description, :user_id, :image, category_ids: [], search_opmtimizations_attributes: [:keyword, :city])
  end

end
