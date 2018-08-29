class AddAdditionalFieldsToVacancy < ActiveRecord::Migration[5.2]
  def change
    add_column :vacancies, :requirments, :text
    add_column :vacancies, :schedule, :text
    add_column :vacancies, :accommodation, :text
    add_column :vacancies, :duties, :text
  end
end
