class DeleteFirstSecondSurname < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :first_surname
  	remove_column :users, :second_surname
  end
end
