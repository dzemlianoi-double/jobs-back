# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def claim_email
    @claim = params[:claim]
    mail(to: model.email.pluck(:value), subject: 'Новый отклик!')
  end

  def suggestion_email
    @suggestion = params[:suggestion]
    mail(to: model.email.pluck(:value), subject: 'Новый отклик!')
  end

  private

  def model
    ApplicationRecord.descendants.select { |klass| klass.to_s == 'Configuration' }.join(', ')
  end
end
