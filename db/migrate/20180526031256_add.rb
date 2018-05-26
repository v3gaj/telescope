class Add < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Value.create_translation_table!({
          :title => :string,
          :description => :text
        }, {
          :migrate_data => true
        })
      end
    end
  end
end
