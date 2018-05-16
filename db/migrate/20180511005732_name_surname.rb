class NameSurname < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :first_name
  	remove_column :users, :second_name
  	add_column :users, :name, :string
  	add_column :users, :surname, :string
  end
end
