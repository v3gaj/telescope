class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :position
      t.string :start_date
      t.string :end_date
      t.text :responsabilities

      t.timestamps
    end
  end
end
