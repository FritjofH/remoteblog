class AddAuthorInformation < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :bio, :text
    add_column :authors, :name, :string
  end
end
