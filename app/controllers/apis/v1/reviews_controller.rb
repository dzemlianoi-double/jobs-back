module Apis
  module V1
    class ReviewsController < ApiController
      def index
        render json: Review.active.by_position, adapter: :json
      end
    end
  end
end
