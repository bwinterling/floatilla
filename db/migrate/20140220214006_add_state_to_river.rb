class AddStateToRiver < ActiveRecord::Migration
  def change
    add_column :rivers, :state, :string
  end
end
