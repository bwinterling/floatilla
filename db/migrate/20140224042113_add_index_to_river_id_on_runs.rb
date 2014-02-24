class AddIndexToRiverIdOnRuns < ActiveRecord::Migration
  def change
    add_index :runs, :river_id
  end
end
