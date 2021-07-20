module Readers
  class PostsController < ReadersController
    def show
      @post = Post.published.friendly.find(params[:id])
      @tags = @post.tags
      @author_profile = @post.author.author_profile
      impressionist(@post)
    end
  end
end