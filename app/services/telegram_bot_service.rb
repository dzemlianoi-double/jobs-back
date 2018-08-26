class TelegramBotService
  def send_claim(claim)
    @claim = claim

    send_message(claim_text)
  end

  def send_suggestion(suggestion)
    @suggestion = suggestion

    send_message(suggestion_text)
  end

  private

  def claim_text
    "Новый отклик на #{@claim.claim_type[:name]} - #{@claim.claim_type[:title]}!
----------------------------
Имя: #{@claim.name}
Телефон: #{@claim.phone_number}
Email: #{@claim.email}
Дополнительная информация: #{@claim.text}"
  end

  def suggestion_text
    "Новая рекоммендация вакансии #{@suggestion.vacancy.name} другу!
----------------------------
Имя: #{@suggestion.name}
Телефон: #{@suggestion.phone_number}"
  end

  def send_message(text)
    Configuration.telegram_recipient.each { |id| Telegram.bot.send_message(chat_id: id, text: text) }
  end
end
