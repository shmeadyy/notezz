class CreateNote < ActiveRecord::Migration
  def up
  	create_table (:notes) do |t|
  		t.string :content
  		t.timestamps
  		t.belongs_to :user
  	end
  end

  def down
  	drop_table (:notes)
  end
end
