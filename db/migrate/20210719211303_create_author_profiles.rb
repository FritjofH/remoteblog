class CreateAuthorProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :author_profiles do |t|
      t.string :authorname, null: false
      t.string :biography, default: ""

      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :author_profiles, [:author_id, :authorname]
  end
end