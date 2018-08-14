class ChangeVacanciesWithNewFields < ActiveRecord::Migration[5.2]
  def change
    add_column :vacancies, :sex, :integer, default: 0
    add_column :vacancies, :experience, :integer, default: 0
  end
end
