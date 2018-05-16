class AddAvailableToSchedules < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Schedule.create_translation_table!({
          :title => :string
        }, {
          :migrate_data => true
        })
      end
    end
  end
end
