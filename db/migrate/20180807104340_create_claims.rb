class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.string :email, index: true
      t.string :phone_number, index: true
      t.string :name, index: true
      t.text :text
      t.integer :position
      t.timestamps
    end
  end
end
