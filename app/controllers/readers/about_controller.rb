module Readers
  class AboutController < ReadersController
    before_action :set_about

    def index
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_about
        @about = About.first
      end
  end
end
