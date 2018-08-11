class VacancyDecorator < Draper::Decorator
  delegate_all

  def age
    age_min == age_max ? age_min : "#{age_min} - #{age_max}"
  end
end
