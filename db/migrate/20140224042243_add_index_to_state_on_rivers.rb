class AddIndexToStateOnRivers < ActiveRecord::Migration
  def change
    add_index :rivers, :state
  end
end
