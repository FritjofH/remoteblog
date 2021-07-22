class CreateAboutListText < ActiveRecord::Migration[6.1]
  def change
    create_table :about_list_texts do |t|
      t.string :title
      t.string :description
      t.references :about, null: false, foreign_key: true
      t.timestamps
    end
  end
end
