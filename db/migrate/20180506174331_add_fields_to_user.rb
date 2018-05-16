class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :second_name, :string
  	add_column :users, :first_surname, :string
  	add_column :users, :second_surname, :string
  	add_column :users, :headline, :string
  	add_column :users, :short_description, :text
  	add_column :users, :phone_number, :string
  	add_column :users, :birth_date, :datetime
  end
end
