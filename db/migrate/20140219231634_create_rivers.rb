class CreateRivers < ActiveRecord::Migration
  def change
    create_table :rivers do |t|
      t.string :name
      t.timestamps
    end
  end
end
