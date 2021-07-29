module Readers
  class PostsController < ReadersController
    helper_method :reading_time

    def show
      @post = Post.published.friendly.find(params[:id])
      @tags = @post.tags
      @page_description = @post.description
      @page_keywords = ""

      @tags.each do |tag|
        @page_keywords += tag.name + ","
      end

      if @page_keywords.present?
        @page_keywords = @page_keywords[0, @page_keywords.length - 1]
      end
      
      impressionist(@post)
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

    def tagged
      if params[:tag].present?
        @tag = ActsAsTaggableOn::Tag.find_by(id: params[:tag])
        @posts = Post.published.tagged_with(@tag)
      else
        @posts = Post.published.all
      end
    end
  end
end