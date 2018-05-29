class AddTranslationToServices < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Service.create_translation_table!({
          :title => :string,
          :subtitle => :string,
          :description => :text
        }, {
          :migrate_data => true
        })
      end
    end
  end
end
