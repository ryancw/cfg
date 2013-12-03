class CreateConfigFiles < ActiveRecord::Migration
  def change
    create_table :config_files do |t|
      t.string :title
      t.string :author
      t.text :configs

      t.timestamps
    end
  end
end
