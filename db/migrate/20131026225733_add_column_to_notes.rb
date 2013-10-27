class AddColumnToNotes < ActiveRecord::Migration
  def up
  	add_column :notes, :complete, :boolean, default: false
  end

  def down
  	remove_column :notes, :complete
  end
end
