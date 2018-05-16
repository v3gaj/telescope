class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.references :degree, foreign_key: true
      t.string :study_field
      t.string :institution
      t.string :start_date
      t.string :end_date
      t.text :description

      t.timestamps
    end
  end
end
