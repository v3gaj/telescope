class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.string :title
      t.string :subtitle
      t.string :url
      t.attachment :background

      t.timestamps
    end
  end
end
