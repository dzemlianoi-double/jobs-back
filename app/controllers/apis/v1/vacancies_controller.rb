module Apis
  module V1
    class VacanciesController < ApiController
      def index
        render json: Vacancy.active.by_position, adapter: :json
      end

      def show
        render json: Vacancy.find(params[:id]), adapter: :json
      end
    end
  end
end
