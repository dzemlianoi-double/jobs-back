# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def claim_email
    @claim = params[:claim]
    mail(to: ::Configuration.email_recipient.pluck(:value), subject: 'Новый отклик!')
  end

  def suggestion_email
    @suggestion = params[:suggestion]
    mail(to: ::Configuration.email_recipient.pluck(:value), subject: 'Новый совет другу!')
  end
end
