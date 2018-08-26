module Apis
  module V1
    class FriendSuggestionsController < ApiController
      def create
        suggestion = FriendSuggestion.create(create_params)
        if suggestion.persisted?
          NotificationMailer.with(suggestion: suggestion).suggestion_email.deliver_later
          bot.send_suggestion(suggestion)
          render nothing: true, status: :ok
        else
          render json: { errors: suggestion.errors.messages }, status: :error
        end
      end

      private

      def bot
        @bot ||= TelegramBotService.new
      end

      def create_params
        params.require(:suggestion).permit(:name, :phone_number, :vacancy_id)
      end
    end
  end
end
