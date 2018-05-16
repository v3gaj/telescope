class AddNotAvailableToDegrees < ActiveRecord::Migration[5.2]
  def change
  	add_column :degrees, :not_available, :boolean
  end
end
