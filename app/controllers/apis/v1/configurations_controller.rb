module Apis
  module V1
    class ConfigurationsController < ApiController
      def basic
        render json: configuration_data.basic_data
      end

      private

      def configuration_data
        @configuration_data ||= ConfigurationData.new
      end
    end
  end
end
