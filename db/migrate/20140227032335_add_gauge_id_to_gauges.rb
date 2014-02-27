class AddGaugeIdToGauges < ActiveRecord::Migration
  def change
    add_column :gauges, :provider_id, :string
  end
end
