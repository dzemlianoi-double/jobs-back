class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name, index: true
      t.string :short_description
      t.text :full_description
      t.string :photo
      t.integer :position
      t.integer :price
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
