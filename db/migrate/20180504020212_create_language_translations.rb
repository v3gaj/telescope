class CreateLanguageTranslations < ActiveRecord::Migration[5.2]
	def change
    reversible do |dir|
      dir.up do
        Language.create_translation_table!({
          :title => :string
        }, {
          :migrate_data => true
        })
      end
    end
  end
end
