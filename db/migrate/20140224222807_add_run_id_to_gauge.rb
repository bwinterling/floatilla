class AddRunIdToGauge < ActiveRecord::Migration
  def change
    add_column :gauges, :run_id, :integer
  end
end
