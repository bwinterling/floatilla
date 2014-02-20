class AddSectionToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :section, :integer
  end
end
