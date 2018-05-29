class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.attachment :image

      t.timestamps
    end
  end
end
