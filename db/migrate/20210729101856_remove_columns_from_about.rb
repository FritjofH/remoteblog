class RemoveColumnsFromAbout < ActiveRecord::Migration[6.1]
  def change
    remove_column :abouts, :description
    remove_column :abouts, :body
  end
end
