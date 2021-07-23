class CreateExternalUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :external_urls do |t|
      t.string :contact
      t.string :github
      t.string :linkedin
      t.references :about, null: false, foreign_key: true

      t.timestamps
    end
  end
end
