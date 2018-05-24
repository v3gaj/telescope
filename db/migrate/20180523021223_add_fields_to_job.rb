class AddFieldsToJob < ActiveRecord::Migration[5.2]
  def change
  	add_column :jobs, :status, :string
  	add_column :jobs, :hire_date, :datetime
  end
end
