class UpdateUserSocial < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :linkedin, :string
  	remove_column :users, :google_plus
  	remove_column :users, :twitter
  	remove_column :users, :pinterest
  	remove_column :users, :youtube
  end
end
