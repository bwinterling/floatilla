class AddRunIdToGauge < ActiveRecord::Migration
  def change
    add_column :gauges, :run_id, :integer
    add_index :gauges, :run_id
  end
end
