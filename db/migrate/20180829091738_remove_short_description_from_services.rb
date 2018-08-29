class RemoveShortDescriptionFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :short_description, :text
  end
end
