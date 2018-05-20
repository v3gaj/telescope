class UserComplete < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :complete, :boolean
  end
end
