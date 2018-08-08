module Apis
  module V1
    class SpecialitiesController < ApiController
      def index
        render json: Speciality.active.by_position, adapter: :json
      end
    end
  end
end
