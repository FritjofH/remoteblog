module Readers
  class AboutController < ReadersController
    before_action :set_about

    def show
      @list_texts = AboutListText.where(about_id: @about.id)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_about
        @about = About.first
      end
  end
end
