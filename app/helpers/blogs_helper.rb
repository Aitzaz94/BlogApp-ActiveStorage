module BlogsHelper
    def purge_image
        @blog = Blog.find(params[:blog_id])
        @image = @blog.image_attachments.find(params[:image_id])
        # @blog.image.purge
        @image.purge
        redirect_back fallback_location: root_path, notice: "success(deletion)"
    end

    def update_image
      @blog = Blog.find(params[:id])
      @image = @blog.image_attachments.find(params[:image_id])
      # @image = @blog.image_attachments.find(params[:image_id])
      # puts(@image)
      if @image.present?
        @image.purge
        @image.attach(params[:image])
        redirect_to root_path(@blog)
      end
    end

end