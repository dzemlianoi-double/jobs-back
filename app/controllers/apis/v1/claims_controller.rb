module Apis
  module V1
    class ClaimsController < ApiController
      def create
        claim = Claim.create(create_params.merge(reasonable: entity))
        if claim.persisted?
          render nothing: true, status: :ok
        else
          render json: { errors: claim.errors.messages }, status: :error
        end
      end

      private

      def entity
        return Vacancy.find(params[:vacancy_id]) if params[:vacancy_id].present?
        Service.find(params[:service_id]) if params[:service_id].present?
      end

      def create_params
        params.require(:claim).permit(:name, :email, :phone_number, :text, :vacancy_id)
      end
    end
  end
end
