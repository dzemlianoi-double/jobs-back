class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name, index: true
      t.string :short_description
      t.text :full_description
      t.integer :price
      t.integer :position
      t.boolean :active, default: true, index: true
      t.timestamps
    end
  end
end
