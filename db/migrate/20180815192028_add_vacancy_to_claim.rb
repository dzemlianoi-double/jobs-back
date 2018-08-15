class AddVacancyToClaim < ActiveRecord::Migration[5.2]
  def change
    add_reference :claims, :vacancy, foreign_key: true
  end
end
