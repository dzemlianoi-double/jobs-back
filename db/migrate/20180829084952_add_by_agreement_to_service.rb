class AddByAgreementToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :by_agreement, :boolean, default: false
  end
end
