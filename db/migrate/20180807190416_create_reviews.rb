class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.text :text
      t.integer :position
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
