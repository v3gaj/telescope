class AddAvailableToLanguages < ActiveRecord::Migration[5.2]
  def change
  	add_column :languages, :available, :boolean
  end
end
