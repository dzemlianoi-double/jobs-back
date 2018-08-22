module Apis
  module V1
    class ClaimsController < ApiController
      def create
        claim = Claim.create(create_params)
        if claim.persisted?
          render nothing: true, status: :ok
        else
          render json: { errors: claim.errors.messages }, status: :error
        end
      end

      private

      def create_params
        params.require(:claim).permit(:name, :email, :phone_number, :text, :vacancy_id)
      end
    end
  end
end
