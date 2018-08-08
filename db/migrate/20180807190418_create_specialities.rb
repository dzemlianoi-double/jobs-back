class CreateSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :specialities do |t|
      t.string :title, index: true
      t.boolean :active, default: true, index: true
      t.integer :position
      t.timestamps
    end
  end
end
