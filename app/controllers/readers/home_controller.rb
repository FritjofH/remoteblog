module Readers
  class HomeController < ReadersController
    helper_method :reading_time

    def index
      @posts = Post.published.most_recently_published
      @page_keywords = ""

      @posts.each do |post|
        post.tag_list.each do |tag|
          @page_keywords += tag + ","
        end
      end

      if @page_keywords.present?
        @page_keywords = @page_keywords[0, @page_keywords.length - 1]
      end
    end

    def reading_time(post)
      words_per_minute = 150
      @content = ""
      post.elements.each do |element|
        if element.element_type == "paragraph"
          if element.content.body != nil
            @content = @content + element.content.body.to_plain_text
          end
        end
      end
      (@content.scan(/\w+/).length / words_per_minute).to_i
    end
  end
end