class ChangePolymorphicInClaims < ActiveRecord::Migration[5.2]
  def change
    remove_reference :claims, :reasonable, polymorphic: true
    add_reference :claims, :reasonable, polymorphic: true, optional: true
  end
end
