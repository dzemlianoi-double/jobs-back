class CreateSpecialityVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :speciality_vacancies do |t|
      t.belongs_to :vacancy
      t.belongs_to :speciality
      t.timestamps
    end
  end
end
