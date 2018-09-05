class TelegramBotService
  def send_claim(claim)
    @claim = claim

    send_message(claim_text)
  end

  def send_suggestion(suggestion)
    @suggestion = suggestion

    send_message(suggestion_text)
  end

  def header_text
    return 'Новый отклик с формы обратной связи' if @claim.claim_type.blank?
    "Новый отклик на #{@claim.claim_type[:name]} - #{@claim.claim_type[:title]}!"
  end

  private

  def claim_text
    "#{header_text}
----------------------------
Имя: #{@claim.name}
Телефон: #{@claim.phone_number}
Email: #{@claim.email}
Дополнительная информация: #{@claim.text}"
  end

  def suggestion_text
    "Новая рекоммендация вакансии #{@suggestion.vacancy.title} другу!
----------------------------
Имя: #{@suggestion.name}
Телефон: #{@suggestion.phone_number}"
  end

  def send_message(text)
    Configuration.telegram_recipient.pluck(:value).each { |id| Telegram.bot.send_message(chat_id: id, text: text) }
  end
end
