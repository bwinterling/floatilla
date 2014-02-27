class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.references :gauge, index: true
      t.datetime :datetime
      t.string :unit
      t.string :value

      t.timestamps
    end
  end
end
