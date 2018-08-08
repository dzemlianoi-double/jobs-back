class CreateVacancyPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancy_photos do |t|
      t.string :name, index: true
      t.string :image
      t.integer :position
      t.boolean :is_main, default: true
      t.belongs_to :vacancy, index: true
      t.timestamps
    end
  end
end
