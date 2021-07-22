module Authors
  class AboutController < AuthorsController

    def new
      if About.first == nil
        @about = About.new
      else
        redirect_to edit_about_path(About.first)
      end
    end
  
    def create
      if (About.first == nil)
        @about = About.new(about_params)
        if @about.save
          redirect_to about_path
        else
          render :new
        end
      end 
    end

    def edit
      @about = About.first
    end

    def update
      @about = About.first
      if @about.update(about_params)
        redirect_to about_path
      else
        render :update, status: :unprocessable_entity
      end
    end

    private
      # Only allow a list of trusted parameters through.
      def about_params
        params.require(:about).permit(:title, :description, :body, :image)
      end
  end
end