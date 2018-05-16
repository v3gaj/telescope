class AddNotAvailableToLanguages < ActiveRecord::Migration[5.2]
  def change
  	add_column :languages, :not_available, :boolean
  	remove_column :languages, :available
  end
end
