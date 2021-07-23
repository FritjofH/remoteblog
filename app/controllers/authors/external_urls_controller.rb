module Authors
  class ExternalUrlsController < ApplicationController
    before_action :set_external_url
    # PATCH/PUT /elements/1
    def update
      @external_url.update(external_url_params)
    end

    private 
      def set_external_url
        @external_url = ExternalUrl.find_by(about_id: About.first.id)
      end

      # Only allow a list of trusted parameters through.
      def external_url_params
        params.require(:external_url).permit(:contact, :linkedin, :github)
      end
  end
end
