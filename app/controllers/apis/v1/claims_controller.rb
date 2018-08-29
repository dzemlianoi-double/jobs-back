module Apis
  module V1
    class ClaimsController < ApiController
      def create
        claim = Claim.create(create_params.merge(reasonable: entity))
        if claim.persisted?
          NotificationMailer.with(claim: claim).claim_email.deliver_later
          bot.send_claim(claim)
          render nothing: true, status: :ok
        else
          render json: { errors: claim.errors.messages }, status: :error
        end
      end

      private

      def bot
        @bot ||= TelegramBotService.new
      end

      def entity
        return Vacancy.find(vacancy_id) if vacancy_id.present?
        Service.find(service_id) if service_id.present?
      end

      def vacancy_id
        @vacancy_id ||= params[:claim][:vacancy_id]
      end

      def service_id
        @service_id ||= params[:claim][:vacancy_id]
      end

      def create_params
        params.require(:claim).permit(:name, :email, :phone_number, :text)
      end
    end
  end
end
