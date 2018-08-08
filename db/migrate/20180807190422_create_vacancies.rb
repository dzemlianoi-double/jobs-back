class CreateVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancies do |t|
      t.string :title, index: true
      t.string :country, index: true
      t.string :city, index: true
      t.integer :salary_min, index: true
      t.integer :salary_max, index: true
      t.integer :offers_quantity
      t.integer :age_min, index: true
      t.integer :age_max, index: true
      t.boolean :is_hot, default: false, index: true
      t.boolean :is_on_main, default: false
      t.boolean :active, default: false, index: true
      t.text :info
      t.integer :position
      t.timestamps
    end
  end
end
