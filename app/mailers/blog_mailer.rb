class BlogMailer < ApplicationMailer
    def new_blog(user, blog)
        @blog = blog
        mail(
            to: user.email,
            from: "#{user.id}@reply.example.com, (#{user.email})",
            subject: "New Blog Post Create by You",
        )
    end

    def update_blog(user, blog)
        @blog = blog
        mail(
            to: user.email,
            from: "#{user.id}@reply.example.com, (#{user.email})",
            subject: "Blog Post Updated by You",
        )
    end

    def delete_blog(user, blog)
        @blog = blog
        mail(
            to: user.email,
            from: "#{user.id}@reply.example.com, (#{user.email})",
            subject: "Blog Post Deleted by You",
        )
    end

    def image_update(user, blog)
        @blog = blog
        mail(
            to: user.email,
            from: "#{user.id}@reply.example.com, (#{user.email})",
            subject: "Blog Post Image Updated by You",
        )
    end
end
