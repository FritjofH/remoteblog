module Authors
  class AboutListTextsController < AuthorsController
    before_action :set_about
    before_action :set_about_list_text, only: [:update, :destroy]

    # POST /elements
    def create
      @about_list_text = AboutListText.new(about_id: About.first.id)
      if @about_list_text.save
        redirect_to edit_about_path(@about)
      end
    end

    # PATCH/PUT /elements/1
    def update
      @about_list_text.update(about_list_texts_params)
    end

    # DELETE /elements/1
    def destroy
      @about_list_text.destroy
      redirect_to edit_about_path(@about_list_text.about)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      
      def set_about
        @about = About.first
      end

      def set_about_list_text
        @about_list_text = AboutListText.where(id: params[:id]).first
      end

      # Only allow a list of trusted parameters through.
      def about_list_texts_params
        params.require(:about_list_text).permit(:title, :description, :about_id)
      end
  end
end
