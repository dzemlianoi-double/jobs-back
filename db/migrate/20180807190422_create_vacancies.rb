class CreateVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancies do |t|
      t.string :title, index: true
      t.string :country
      t.string :city
      t.integer :salary_min
      t.integer :salary_max
      t.integer :offers_quantity
      t.integer :age_min
      t.integer :age_max
      t.boolean :is_hot, default: false
      t.boolean :is_on_main, default: false
      t.boolean :active, default: false
      t.text :info
      t.integer :position
      t.timestamps
    end
  end
end
