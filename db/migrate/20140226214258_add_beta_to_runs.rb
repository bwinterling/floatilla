class AddBetaToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :difficulty, :string
    add_column :runs, :min_flow, :integer
    add_column :runs, :max_flow, :integer
    add_column :runs, :gradient, :integer
    add_column :runs, :length, :integer
    add_column :gauges, :state, :string
    add_column :gauges, :provider, :string
  end
end
