module Apis
  module V1
    class ServicesController < ApiController
      def index
        render json: Service.active.by_position, adapter: :json
      end

      def show
        render json: Service.find(params[:id]), adapter: :json
      end
    end
  end
end
