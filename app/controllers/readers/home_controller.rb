module Readers
  class HomeController < ReadersController
    helper_method :reading_time

    def index
      @posts = Post.published.most_recently_published
    end

    def reading_time(post)
      words_per_minute = 150
      @content = ""
      post.elements.each do |element|
        if element.element_type == "paragraph"
          @content = @content + element.content.body.to_plain_text
        end
      end
      (@content.scan(/\w+/).length / words_per_minute).to_i
    end
  end
end