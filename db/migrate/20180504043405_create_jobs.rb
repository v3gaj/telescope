class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.text :job_description
      t.text :requirements
      t.text :preferred
      t.references :language, foreign_key: true
      t.references :industry, foreign_key: true
      t.references :employment, foreign_key: true
      t.references :schedule, foreign_key: true
      t.string :province
      t.string :other_signs

      t.timestamps
    end
  end
end
