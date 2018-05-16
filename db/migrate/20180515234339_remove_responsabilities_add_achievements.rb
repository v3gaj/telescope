class RemoveResponsabilitiesAddAchievements < ActiveRecord::Migration[5.2]
  def change
  	add_column :experiences, :achievements, :text
  	remove_column :experiences, :responsabilities
  end
end
