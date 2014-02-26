class ChangeRunLengthToFloat < ActiveRecord::Migration
  def change
    remove_column :runs, :length
    add_column :runs, :length, :float
  end
end
