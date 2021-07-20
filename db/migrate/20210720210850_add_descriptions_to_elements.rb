class AddDescriptionsToElements < ActiveRecord::Migration[6.1]
  def change
    add_column :elements, :description, :text
  end
end
