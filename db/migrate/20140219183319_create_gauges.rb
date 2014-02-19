class CreateGauges < ActiveRecord::Migration
  def change
    create_table :gauges do |t|
      t.string :name
      t.decimal :lat,  {:precision=>10, :scale=>6}
      t.decimal :long, {:precision=>10, :scale=>6}

      t.timestamps
    end

    add_index :gauges, :lat
    add_index :gauges, :long
  end
end
