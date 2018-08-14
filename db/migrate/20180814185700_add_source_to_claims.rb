class AddSourceToClaims < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :source, :integer, default: 0
  end
end
