module Readers
  class PostsController < ReadersController
    def show
      @post = Post.published.friendly.find(params[:id])
      @tags = @post.tags
      impressionist(@post)
    end
  end
end