class UpdateVacanciesWithPastArrivalDateJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Vacancy.where('arrive_date <= ?', Date.today).update_all(is_hot: false, arrive_date: nil)
  end
end
