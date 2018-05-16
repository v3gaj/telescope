class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.boolean :not_available

      t.timestamps
    end
  end
end
