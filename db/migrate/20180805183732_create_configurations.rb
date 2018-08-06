class CreateConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :configurations do |t|
      t.string :key, index: true
      t.string :value
      t.integer :basic_type, default: 0
      t.timestamps
    end
  end
end
