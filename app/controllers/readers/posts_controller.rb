module Readers
  class PostsController < ReadersController
    def show
      @post = Post.published.friendly.find(params[:id])
      @tags = @post.tags
      impressionist(@post)
    end

    def tagged
      if params[:tag].present?
        @tag = ActsAsTaggableOn::Tag.where(id: params[:tag]).first
        @posts = Post.published.tagged_with(@tag)
      else
        @posts = Post.published.all
      end
    end
  end
end