class CreateSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :specialities do |t|
      t.string :title
      t.boolean :active, default: true
      t.integer :position
      t.timestamps
    end
  end
end
