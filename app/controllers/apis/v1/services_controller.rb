module Apis
  module V1
    class ServicesController < ApiController
      def index
        render json: { services: Service.active.by_position }
      end
    end
  end
end
