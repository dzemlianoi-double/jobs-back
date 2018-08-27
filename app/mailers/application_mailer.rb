# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'worker.dp.ua@gmail.com'
  layout 'mailer'
end
