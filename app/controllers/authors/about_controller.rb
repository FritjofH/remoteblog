module Authors
  class AboutController < AuthorsController
    before_action :set_about

    def new
      if @about == nil
        @about = About.new
        @about.save
        @external_url = ExternalUrl.new(about_id: @about.id)
        @external_url.save
        redirect_to edit_about_path(@about)
      else
        redirect_to edit_about_path(About.first)
      end
    end

    def edit
      @about_list_text = @about.about_list_texts.build
      @external_url = ExternalUrl.find_by(about_id: @about.id)
    end
    
    def create
      if @about == nil
        @about = About.new(about_params)
        if @about.save
          redirect_to about_path
        else
          render :new
        end
      end 
    end
    
    def update
      if @about.update(about_params)
        redirect_to about_path
      else
        render :update, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_about
        @about = About.first
      end

      # Only allow a list of trusted parameters through.
      def about_params
        params.require(:about).permit(:title, :description, :body, :image)
      end
  end
end