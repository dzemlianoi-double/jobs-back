class ChangeVacancies < ActiveRecord::Migration[5.2]
  def change
    remove_column :vacancies, :salary_max
    add_column :vacancies, :video_url, :string
    add_column :vacancies, :arrive_date, :date    
  end
end
