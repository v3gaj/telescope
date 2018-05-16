class IconForIndustry < ActiveRecord::Migration[5.2]
  def change
  	add_column :industries, :icon, :string
  end
end
