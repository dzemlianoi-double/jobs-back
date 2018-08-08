module Apis
  module V1
    class VacanciesController < ApiController
      DEFAULT_LATEST_QUANTITY = 3
      MAX_LATEST_QUANTITY = 10

      def index
        render json: Vacancy.active.by_position, adapter: :json
      end

      def show
        render json: Vacancy.find(params[:id]), adapter: :json
      end

      def last
        render json: Vacancy.latest.first(quantity)
      end

      private

      def quantity
        return params[:quantity]&.to_i if (DEFAULT_LATEST_QUANTITY..MAX_LATEST_QUANTITY).cover? params[:quantity]&.to_i
        DEFAULT_LATEST_QUANTITY
      end
    end
  end
end
