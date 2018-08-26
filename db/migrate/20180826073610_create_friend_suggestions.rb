class CreateFriendSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_suggestions do |t|
      t.string :name
      t.string :phone_number
      t.belongs_to :vacancy
      t.timestamps
    end
  end
end
