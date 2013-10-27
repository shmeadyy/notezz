class AddColumnsToUser < ActiveRecord::Migration
  def up
  		add_column :users, :username, :string
  		add_column :users, :password, :string
  end

  def down
  	remove_column :users, :username	
  	remove_column :users, :password
  end
end
