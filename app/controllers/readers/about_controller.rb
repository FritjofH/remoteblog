module Readers
  class AboutController < ReadersController
    def index
      @post = Post.published.count
      @published_at_first = Post.published.count
    end
  end
end
