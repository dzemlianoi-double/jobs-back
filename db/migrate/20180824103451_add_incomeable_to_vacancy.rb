class AddIncomeableToVacancy < ActiveRecord::Migration[5.2]
  def change
    remove_reference :claims, :vacancy, index: true
    change_table :claims do |t|
      t.references :reasonable, polymorphic: true
    end
  end
end
